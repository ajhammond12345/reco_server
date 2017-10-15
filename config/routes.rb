Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users do
		member do
			#get :unique
		end
		collection do
			post :unique_username
			post :unique_email
            post :login
		end
	end

	resources :managers do
	end
	resources :tenants do
	end
	resources :rentals do
	end
	resources :expenses do
	end
	resources :contracts do
	end
	resources :notifications do
	end
	resources :pictures do
	end
end
