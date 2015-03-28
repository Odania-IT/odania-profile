# This migration comes from odania_core_engine (originally 20141003183746)
class RemoveTitleFromMenu < ActiveRecord::Migration
	def change
		remove_column :odania_menus, :title
	end
end
