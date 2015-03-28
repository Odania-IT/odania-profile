# This migration comes from odania_core_engine (originally 20150306152017)
class AddFlagToLanguage < ActiveRecord::Migration
	def change
		add_column :odania_languages, :flag_image, :string
	end
end
