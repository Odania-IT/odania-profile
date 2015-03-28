# This migration comes from odania_core_engine (originally 20141017123813)
class AddWidgetIdToMenu < ActiveRecord::Migration
	def change
		add_column :odania_menus, :widget_id, :integer, null: true
	end
end
