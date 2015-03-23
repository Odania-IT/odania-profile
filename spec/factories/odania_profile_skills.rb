FactoryGirl.define do
	factory :odania_profile_skill, :class => 'OdaniaProfile::Skill' do
		profile
		name "MyString"
		percent { rand(100) }
	end

end
