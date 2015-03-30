require 'rails_helper'

RSpec.describe OdaniaProfile::ProfilesController, :type => :controller do
	before :each do
		@site = create(:site)
		@request.host = @site.host

		@language = create(:language)
		@profile = create(:profile, :with_skills, :with_timeline, user: OdaniaTestMock.current_user, site: @site, language: @language, published: true)
	end

	context 'public display' do
		it 'should display public profiles' do
			get :index, {locale: @language.iso_639_1}

			expect(response).to be_success
			expect(response).to render_template('odania_profile/profiles/index')
		end

		it 'should display profile' do
			profile = create(:profile, :with_skills,  user: OdaniaTestMock.current_user, site: @site, language: @language, published: false)
			get :show, {id: profile.id, locale: @language.iso_639_1}

			expect(response.response_code).to be(302)
		end

		it 'should display profile' do
			get :show, {id: @profile.id, locale: @language.iso_639_1}

			expect(response).to be_success
			expect(response).to render_template('odania_profile/profiles/show')
		end
	end
end
