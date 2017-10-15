#Copyright Alexander Hammond
#October 14 2017

class CreateRentals < ActiveRecord::Migration 
	def change
		create_table :rentals do |t|
			t.string :rental_address
            t.integer :rental_tenant_id
            t.integer :manager_id
            t.string :rental_image
            t.integer :rental_rent
			t.timestamps
		end
	end
end
