require 'odania_core'
require 'odania'
require 'odania_timeline'

module OdaniaProfile
	PLUGIN_NAME = 'odania_profile'

	class Engine < ::Rails::Engine
		config.generators do |g|
			g.test_framework :rspec
			g.fixture_replacement :factory_girl, :dir => 'spec/factories'
		end

		Odania.protected.plugins << OdaniaProfile::PLUGIN_NAME
		Odania.protected.pages << {name: 'Personal Profile', in_menu: true, path: '/odania_profile/profile/index', controller: 'OdaniaProfileProfileController',
											template: 'odania_profile/profile/index', active: OdaniaProfile::PLUGIN_NAME}
		Odania.protected.pages << {name: 'Edit Personal Profile', in_menu: false, path: '/odania_profile/profile/edit', controller: 'OdaniaProfileEditProfileController',
											template: 'odania_profile/profile/edit', active: OdaniaProfile::PLUGIN_NAME}

		# Add content types
		Odania::TargetType.targets['PROFILES'] = {type: 'PROFILES',
										module: 'OdaniaProfile::EngineTargetType', validator_func: 'validate_profiles',
										render_func: '', selector: 'protected/odania_profile/profiles/choose_profiles',
										initial_data: 'admin/api/menu_items/empty_inital_data'}
		Odania::TargetType.targets['PROFILE'] = {type: 'PROFILE',
										module: 'OdaniaProfile::EngineTargetType', validator_func: 'validate_profile',
										render_func: '', selector: 'protected/odania_profile/profiles/choose_profile',
										initial_data: 'protected/api/odania_profile/profiles/inital_data'}
	end
end
