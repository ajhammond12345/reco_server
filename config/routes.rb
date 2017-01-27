Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	resources :comments do
	end

	
	get 'total', to: 'items#total'

	resources :items do
		collection do
			get :nicolas
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
