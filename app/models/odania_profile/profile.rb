class OdaniaProfile::Profile < ActiveRecord::Base
	serialize :social, JSON

	belongs_to :site, :class_name => 'Odania::Site'
	belongs_to :user, class_name: 'Odania::User'
	belongs_to :language, class_name: 'Odania::Language'
	has_many :skills, class_name: 'OdaniaProfile::Skill'
	belongs_to :timeline, class_name: 'OdaniaTimeline::Timeline'

	has_attached_file :image, :styles => {:medium => '300x300>', :thumb => '100x100>'},
							default_url: '/images/odania_profile/defaults/profile_:style.jpg'
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def to_param
		"#{self.id}-#{self.title.parameterize}"
	end

	before_save do
		self.published = false if self.published.nil?
		self.social = {none: ''} if self.social.nil?

		true
	end
end
