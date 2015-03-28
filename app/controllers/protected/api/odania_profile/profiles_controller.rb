class Protected::Api::OdaniaProfile::ProfilesController < Protected::ApiController
	before_action :load_profile

	def index
		@timelines = OdaniaTimeline::Timeline.where(user_id: current_user.id, language_id: @profile.language_id)
	end

	def update
		if @profile.update(profile_attributes)
			update_skills
			render action: :index
		else
			render json: {errors: @profile.errors}, status: :bad_request
		end
	end

	private

	def profile_attributes
		params.require(:profile).permit(:title, :name, :profession, :description, :published, :image, :timeline_id, :social => [:linked_in, :facebook, :google_plus, :twitter, :rss])
	end

	def load_profile
		language_id = params[:language_id].nil? ? current_site.default_language_id : params[:language_id]
		language_id = current_site.default_language_id unless current_site.menus.pluck(:language_id).include? language_id
		@profile = OdaniaProfile::Profile.where(user_id: current_user.id, language_id: language_id).first
		@profile = OdaniaProfile::Profile.new(user_id: current_user.id, language_id: language_id) if @profile.nil?
	end

	def update_skills
		skill_ids = []
		unless params[:profile][:skillSelection].nil?
			params[:profile][:skillSelection].split(',').each do |data|
				data = data.split(':')

				skill = @profile.skills.where(name: data[0]).first
				skill = @profile.skills.new(name: data[0]) if skill.nil?
				skill.percent = data[1].to_i
				skill.percent = 0 if skill.percent < 0
				skill.percent = 100 if skill.percent > 100
				skill.save!
				skill_ids << skill.id
			end
		end

		@profile.skills.where('id NOT IN (?)', skill_ids).destroy_all
	end
end
