require 'odania_profile/engine'

module OdaniaProfile
	autoload :EngineTargetType, 'odania_profile/engine_target_type'

	def self.table_name_prefix
		'odania_profile_'
	end
end
