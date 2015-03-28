# This migration comes from odania_core_engine (originally 20141016214225)
class AddWidgetIdToContentAndSite < ActiveRecord::Migration
	def change
		add_column :odania_contents, :widget_id, :integer, null: true
		add_column :odania_sites, :default_widget_id, :integer, null: true
	end
end
