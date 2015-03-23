# This migration comes from odania_core_engine (originally 20150309005705)
class AddParentToCategory < ActiveRecord::Migration
	def change
		add_column :odania_categories, :parent_id, :integer
		add_foreign_key :odania_categories, :odania_categories, column: :parent_id
	end
end
