#Copyright Alexander Hammond January 16, 2017

require 'json'

class Item < ActiveRecord::Base
	
	has_many :comments, dependent: :destroy
	
	mount_uploader :item_image, ImageUploader
	mount_base64_uploader :item_image, ImageUploader, file_name: 'itempic'	
	#Calls set_default_values after it has finished initializing
	after_initialize :set_default_values, if: :new_record?

	#Before it creates the object it calls the build_defaults
	before_create :build_defaults
     

   
	attr_accessor :image_data
	before_save :decode_image_data

  	def decode_image_data

    		if self.image_data.present?
        		data = StringIO.new(Base64.decode64(self.image_data))
        		data.class.class_eval {attr_accessor :original_filename, :content_type}
        		data.original_filename = self.id.to_s + ".png"
        		data.content_type = "image/png"

        		self.item_image = data
    		end
  	end

	#These methods are standard for building Rails databases
	private
		
		def set_default_values
		end
		
		def build_defaults
		end
end

	#add_attachment :posts, :item_image	
