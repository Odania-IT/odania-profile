# This migration comes from odania_core_engine (originally 20150309001529)
class AddStateToContent < ActiveRecord::Migration
	def change
		add_column :odania_contents, :state, :integer
	end
end
