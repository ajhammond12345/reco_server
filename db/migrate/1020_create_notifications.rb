#Copyright Alexander Hammond
#October 14 2017

class CreateNotifications < ActiveRecord::Migration 
	def change
		create_table :notifications do |t|
            t.integer :user_id
            t.string :notification_title
            t.string :notification_text
            t.boolean :notification_resolved
            t.boolean :notification_is_problem_with_property
            t.timestamps
		end
	end
end
