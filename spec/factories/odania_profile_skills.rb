FactoryGirl.define do
	factory :profile_skill, :class => 'OdaniaProfile::Skill' do
		profile
		name { FFaker::Name.name }
		percent { rand(100) }
	end

end
