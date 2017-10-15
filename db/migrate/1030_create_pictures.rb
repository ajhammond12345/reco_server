#Copyright Alexander Hammond
#October 14 2017

class CreatePictures < ActiveRecord::Migration 
	def change
		create_table :pictures do |t|
			t.boolean :picture_is_before_photo
			t.string :picture_image
			t.timestamps
		end
	end
end
