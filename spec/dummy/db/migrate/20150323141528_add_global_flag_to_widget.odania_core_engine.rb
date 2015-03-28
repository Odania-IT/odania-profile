# This migration comes from odania_core_engine (originally 20150307141348)
class AddGlobalFlagToWidget < ActiveRecord::Migration
	def change
		add_column :odania_widgets, :is_global, :boolean, default: false
	end
end
