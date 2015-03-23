json.profile do
	json.partial! partial: 'protected/api/odania_profile/profiles/show', locals: {profile: @profile}
end
