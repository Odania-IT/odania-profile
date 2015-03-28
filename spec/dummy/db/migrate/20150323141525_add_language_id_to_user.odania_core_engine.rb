# This migration comes from odania_core_engine (originally 20150306145003)
class AddLanguageIdToUser < ActiveRecord::Migration
	def change
		add_column :odania_users, :language_id, :integer
	end
end
