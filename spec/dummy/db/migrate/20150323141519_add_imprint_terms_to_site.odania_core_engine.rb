# This migration comes from odania_core_engine (originally 20140512161811)
class AddImprintTermsToSite < ActiveRecord::Migration
	def change
		add_column :odania_sites, :imprint, :text
		add_column :odania_sites, :terms_and_conditions, :text
	end
end
