Rails.application.routes.draw do

	root to: 'home#index'
	devise_for :users
	resources :communities do
		resources :posts do
			member do
			  get 'like'
			  get 'unlike'
			end
			resources :comments
		end
	end
end
