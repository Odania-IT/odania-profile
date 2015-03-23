class CreateOdaniaProfileSkills < ActiveRecord::Migration
	def change
		create_table :odania_profile_skills do |t|
			t.references :profile, index: true
			t.string :name
			t.integer :percent
			t.timestamps null: false
		end
		add_foreign_key :odania_profile_skills, :odania_profile_profiles, column: :profile_id
	end
end
