json.profile do
	json.partial! partial: 'protected/api/odania_profile/profiles/show', locals: {profile: @profile}
end

json.data do
	json.timelines @timelines, partial: 'protected/api/odania_timeline/timelines/show', as: :timeline
end
