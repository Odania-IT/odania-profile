class OdaniaProfile::Profile < ActiveRecord::Base
	serialize :social, JSON

	belongs_to :user, class_name: 'Odania::User'
	belongs_to :language, class_name: 'Odania::Language'
	has_many :skills, class_name: 'OdaniaProfile::Skill'

	before_save do
		self.published = false if self.published.nil?
		self.social = {none: ''} if self.social.nil?

		true
	end
end
