module OdaniaProfile
	module EngineTargetType
		class << self
			def validate_profiles(menu_item, target_data)
				menu_item.full_path = 'odania_profile/profiles'

				nil
			end

			def validate_profile(menu_item, target_data)
				return 'invalid profile id' if target_data['id'].nil?

				profile = OdaniaProfile::Profile.where(id: target_data['id']).first
				return 'invalid profile id' if profile.nil?

				menu_item.full_path = "odania_profile/profiles/#{profile.to_param}"

				return nil
			end
		end
	end
end
