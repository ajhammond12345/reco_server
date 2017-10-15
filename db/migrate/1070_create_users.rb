#Copyright Alexander Hammond
#January 16 2017

class CreateUsers < ActiveRecord::Migration 
	def change
		create_table :users do |t|
			t.string :username
			t.string :user_password
			t.string :email_address
            t.string :user_address
            t.string :user_name
            t.string :user_phone_number
			t.timestamps
		end
	end
end
