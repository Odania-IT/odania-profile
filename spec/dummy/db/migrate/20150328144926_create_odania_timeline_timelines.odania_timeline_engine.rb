# This migration comes from odania_timeline_engine (originally 20150327172503)
class CreateOdaniaTimelineTimelines < ActiveRecord::Migration
	def change
		create_table :odania_timeline_timelines do |t|
			t.references :user, index: true
			t.references :language, index: true
			t.references :site, index: true
			t.string :title
			t.boolean :is_public
			t.timestamps null: false
		end
		add_foreign_key :odania_timeline_timelines, :odania_sites, column: :site_id
		add_foreign_key :odania_timeline_timelines, :odania_users, column: :user_id
		add_foreign_key :odania_timeline_timelines, :odania_languages, column: :language_id
	end
end
