#Copyright Alexander Hammond
#October 14 2017

class CreateManagers < ActiveRecord::Migration 
	def change
		create_table :managers do |t|
			t.integer :manager_user_id
            t.string :manager_code
			t.timestamps
		end
	end
end
