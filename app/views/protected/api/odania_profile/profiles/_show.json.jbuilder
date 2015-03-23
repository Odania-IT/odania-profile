json.id profile.id
json.title profile.title
json.name profile.name
json.profession profile.profession
json.description profile.description
json.social profile.social
json.published profile.published

json.skills profile.skills, partial: 'protected/api/odania_profile/skills/show', as: :skill
