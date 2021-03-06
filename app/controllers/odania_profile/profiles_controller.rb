class OdaniaProfile::ProfilesController < ApplicationController
	before_action :valid_site!, :valid_menu!

	def index
		@profiles = OdaniaProfile::Profile.where(published: true).order('updated_at DESC')
	end

	def show
		@profile = OdaniaProfile::Profile.where(published: true, id: params[:id].to_i).first
		redirect_to odania_profile_profiles_path if @profile.nil?
	end
end
