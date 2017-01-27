#Copyright Alexander Hammond
#January 16 2017

class CreateComments < ActiveRecord::Migration 
	def change
		create_table :comments do |t|
			t.references :item
			t.text :comment_text
			t.timestamps
		end
	end
end
