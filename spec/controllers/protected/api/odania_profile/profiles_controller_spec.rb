require 'rails_helper'

RSpec.describe Protected::Api::OdaniaProfile::ProfilesController, :type => :controller do
	before :each do
		@site = create(:site)
		@request.host = @site.host

		@language = create(:language)
		@profile = create(:profile, :with_timeline, :with_skills, user: OdaniaTestMock.current_user, site: @site, language: @language)
	end

	context 'when not logged in' do
		it 'should give unauthorized' do
			OdaniaTestMock.signed_in = false
			get :index, {format: :json}
			OdaniaTestMock.signed_in = true

			expect(response.response_code).to be(302)
		end
	end

	context 'when logged in' do
		it 'should list profiles' do
			get :index, {format: :json}

			expect(response).to be_success
			expect(response).to render_template('protected/api/odania_profile/profiles/index')
		end

		it 'should update profile' do
			profile = build(:profile)
			timeline = create(:timeline, :with_contents)

			assert_difference 'OdaniaProfile::Profile.count' do
				assert_difference 'OdaniaProfile::Skill.count', 5 do
					post :update, {format: :json, profile: {title: profile.title, published: false,
																		 name: FFaker::Internet.user_name, profession: FFaker::Job.title,
																		 description: FFaker::HTMLIpsum.body, timeline_id: timeline.id, skillSelection: [
											['Skill1', rand(100)].join(':'),
											['Skill2', rand(100)].join(':'),
											['Skill3', rand(100)].join(':'),
											['Skill4', rand(100)].join(':'),
											['Skill5', rand(100)].join(':')
										].join(',')}}
				end
			end

			expect(response).to be_success
			expect(response).to render_template('protected/api/odania_profile/profiles/index')
		end
	end
end
