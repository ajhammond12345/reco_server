Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	resources :comments do
	end

	
	get 'total', to: 'items#total'

	resources :items do
		member do
#			get :filtered_list
		end
		collection do
			get :nicolas
#			get :filtered_list
			post :filtered_list
		end
	end

# do
#		collection do
#		end
#		member do
#			get :show
#			get :create
#			get :destroy
#			get :edit
#			get :index
#			get :new
#			get :update
#			post :update
#			post :edit
#		end
#	end

end
