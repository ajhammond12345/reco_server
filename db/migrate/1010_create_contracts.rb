#Copyright Alexander Hammond
#October 14 2017

class CreateContracts < ActiveRecord::Migration 
	def change
		create_table :contracts do |t|
            t.integer :user_id
			t.boolean :contract_signed
			t.string :contract_date_signed
			t.string :contract_date_ended
			t.string :contract_pdf_file_path
			t.integer :contract_property_id
			t.timestamps
		end
	end
end
