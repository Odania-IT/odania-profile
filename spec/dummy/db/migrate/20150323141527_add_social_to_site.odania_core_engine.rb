# This migration comes from odania_core_engine (originally 20150307133340)
class AddSocialToSite < ActiveRecord::Migration
	def change
		add_column :odania_sites, :social, :text
	end
end
