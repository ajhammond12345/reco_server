#Copyright Alexander Hammond
#October 14 2017

class CreateExpenses < ActiveRecord::Migration 
	def change
		create_table :expenses do |t|
            t.integer :user_id
			t.integer :expense_amount
			t.string :expense_reason
            t.integer :expense_property_id
			t.timestamps
		end
	end
end
