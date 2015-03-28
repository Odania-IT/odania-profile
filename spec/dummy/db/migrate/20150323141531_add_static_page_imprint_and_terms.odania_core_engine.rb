# This migration comes from odania_core_engine (originally 20150307233137)
class AddStaticPageImprintAndTerms < ActiveRecord::Migration
	def change
		remove_column :odania_sites, :imprint
		remove_column :odania_sites, :terms_and_conditions

		add_column :odania_sites, :imprint_id, :integer
		add_column :odania_sites, :terms_and_conditions_id, :integer
	end
end
