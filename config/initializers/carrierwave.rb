#config/initializers/carrierwave.rb

CarrierWave.configure do |config|

	config.fog_provider = 'fog/aws'
	config.fog_credentials = {
		provider:              'AWS',
		aws_access_key_id:     'AKIAJDB2HXVACVMO2I5A',
		aws_secret_access_key: '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',
		region:                'us-east-1'
	}
	


	config.fog_directory = 'garage-sale-fbla'
end
