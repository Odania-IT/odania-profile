FactoryGirl.define do
	factory :profile, :class => 'OdaniaProfile::Profile' do
		site
		user
		language
		title { FFaker::Movie.title }
		name { FFaker::Internet.user_name }
		profession { FFaker::Job.title }
		social {}
		description { FFaker::HTMLIpsum.body }

		trait :with_skills do
			# Default value for amount of items
			transient do
				amount 2
			end

			after(:create) do |profile, evaluator|
				create_list(:profile_skill, evaluator.amount, profile: profile)
			end
		end

		trait :with_timeline do
			timeline
		end
	end

end
