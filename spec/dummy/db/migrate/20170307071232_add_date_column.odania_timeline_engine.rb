# This migration comes from odania_timeline_engine (originally 20150401192045)
class AddDateColumn < ActiveRecord::Migration
	def change
		rename_column :odania_timeline_timeline_contents, :timeline_date, :from_date
		add_column :odania_timeline_timeline_contents, :to_date, :date
	end
end
