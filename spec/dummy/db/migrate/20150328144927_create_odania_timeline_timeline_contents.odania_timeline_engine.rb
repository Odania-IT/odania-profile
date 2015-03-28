# This migration comes from odania_timeline_engine (originally 20150327172813)
class CreateOdaniaTimelineTimelineContents < ActiveRecord::Migration
	def change
		create_table :odania_timeline_timeline_contents do |t|
			t.references :timeline, index: true
			t.date :timeline_date
			t.string :title
			t.text :body
			t.timestamps null: false
		end
		add_foreign_key :odania_timeline_timeline_contents, :odania_timeline_timelines, column: :timeline_id
	end
end
