# This migration comes from odania_core_engine (originally 20150315204519)
class AddDisplayCategoriesToMenu < ActiveRecord::Migration
	def change
		add_column :odania_menus, :display_categories, :boolean, default: true
	end
end
