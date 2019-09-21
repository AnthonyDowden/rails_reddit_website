Rails.application.routes.draw do


	root to:'home#index'

	resources :communities do
		resources :posts do
			resources :comments
		end
	end
end
