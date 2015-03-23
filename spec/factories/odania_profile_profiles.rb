FactoryGirl.define do
	factory :odania_profile_profile, :class => 'OdaniaProfile::Profile' do
		user
		language
		title "MyString"
		name "MyString"
		profession "MyString"
		social "MyText"
		description "MyText"
	end

end
