class CreateOdaniaProfileProfiles < ActiveRecord::Migration
	def change
		create_table :odania_profile_profiles do |t|
			t.references :user, index: true
			t.references :language, index: true
			t.references :site, index: true
			t.string :title
			t.string :name
			t.string :profession
			t.text :social
			t.text :description
			t.boolean :published
			t.timestamps null: false
		end
		add_foreign_key :odania_profile_profiles, :odania_sites, column: :site_id
		add_foreign_key :odania_profile_profiles, :odania_users, column: :user_id
		add_foreign_key :odania_profile_profiles, :odania_languages, column: :language_id
	end
end