class OdaniaProfile::Skill < ActiveRecord::Base
	belongs_to :profile, class_name: 'OdaniaProfile::Profile'
end
