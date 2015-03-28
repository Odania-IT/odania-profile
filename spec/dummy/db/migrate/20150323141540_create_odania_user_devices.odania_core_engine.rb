# This migration comes from odania_core_engine (originally 20150317160217)
class CreateOdaniaUserDevices < ActiveRecord::Migration
	def change
		create_table :odania_user_devices do |t|
			t.references :user, index: true
			t.string :platform
			t.string :token
			t.string :uuid
			t.string :model
			t.string :version
			t.timestamps null: false
		end
		add_foreign_key :odania_user_devices, :odania_users, column: :user_id
	end
end
