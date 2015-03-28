json.id profile.id
json.title profile.title
json.name profile.name
json.profession profile.profession
json.description profile.description
json.social profile.social
json.published profile.published
json.image_url profile.image.url
json.image_thumb_url profile.image.url(:thumb)
json.image_medium_url profile.image.url(:medium)
json.timeline_id profile.timeline_id

json.skills profile.skills, partial: 'protected/api/odania_profile/skills/show', as: :skill
