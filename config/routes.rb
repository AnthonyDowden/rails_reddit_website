Rails.application.routes.draw do


	root to:'home#index'

	resources :communities
	resources :posts

end
