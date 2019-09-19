Rails.application.routes.draw do


	root to:'home#index'

	resources :communities
	resources :posts do
	  resources :comments
	end

end
