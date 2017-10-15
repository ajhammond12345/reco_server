#Copyright Alexander Hammond January 16, 2017

require 'json'

class Rental < ActiveRecord::Base
    has_many :pictures, dependent: :destroy
    belongs_to :manager
	#Calls set_default_values after it has finished initializing
	after_initialize :set_default_values, if: :new_record?

	#Before it creates the object it calls the build_defaults
	before_create :build_defaults

    def decode_image_data(va_image_data)
    	if va_image_data.present?                                                  
			data = StringIO.new(Base64.decode64(va_image_data))
            data.class.class_eval {attr_accessor :original_filename, :content_type}
            data.original_filename =  "image.jpeg"
            data.content_type = "image/jpeg"
            logger.debug("Data content type for image: #{data.content_type}")
            logger.debug("Data filename for image: #{data.original_filename}")
            logger.debug("Data for image: #{data}")
            self.rental_image = data                                                  
            logger.debug("Image: #{self.item_image}")
        end
    end

	#These methods are standard for building Rails databases
	private
		
		def set_default_values
		end
		
		def build_defaults
		end
end

