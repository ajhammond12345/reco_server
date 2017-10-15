#Copyright Alexander Hammond
#October 14 2017

class CreateTenants < ActiveRecord::Migration 
	def change
		create_table :tenants do |t|
			t.integer :tenant_user_id
            t.integer :tenant_rental_id
			t.timestamps
		end
	end
end
