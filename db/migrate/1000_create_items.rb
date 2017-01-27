#Copyright Alexander Hammond
#January 16 2017

class CreateItems < ActiveRecord::Migration 
	def change
		create_table :items do |t|
			t.string :item_name
			t.integer :item_condition
			t.string :item_description
			t.integer :item_price_in_cents
			t.integer :item_purchase_state
			t.string :item_image
			t.timestamps
		end
	end
end
