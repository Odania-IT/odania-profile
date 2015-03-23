require 'odania_core'
require 'odania'

module OdaniaProfile
	PLUGIN_NAME = 'odania_profile'

	class Engine < ::Rails::Engine
		config.generators do |g|
			g.test_framework :rspec
			g.fixture_replacement :factory_girl, :dir => 'spec/factories'
		end

		Odania.protected.plugins << OdaniaProfile::PLUGIN_NAME
		Odania.protected.pages << {name: 'Personal Profile', in_menu: true, path: '/odania_profile/profile/index', controller: 'OdaniaProfileProfileController', template: 'odania_profile/profile/index', active: OdaniaProfile::PLUGIN_NAME}
		Odania.protected.pages << {name: 'Edit Personal Profile', in_menu: false, path: '/odania_profile/profile/edit', controller: 'OdaniaProfileEditProfileController', template: 'odania_profile/profile/edit', active: OdaniaProfile::PLUGIN_NAME}
	end
end
