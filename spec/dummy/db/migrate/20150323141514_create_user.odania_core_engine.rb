# This migration comes from odania_core_engine (originally 20140313225265)
class CreateUser < ActiveRecord::Migration
	def change
		create_table :odania_users do |t|
			t.integer :site_id
			t.string :name
			t.string :email
			t.string :admin_layout
			t.string :ip
			t.datetime :last_login
			t.timestamps null: false
		end
	end
end
