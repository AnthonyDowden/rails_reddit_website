Rails.application.routes.draw do

	root to: 'home#index'
	devise_for :users
	resources :profiles, except: [:index]
	resources :communities do
		resources :posts do
			member do
				get 'like'
				get 'unlike'
			end
			resources :comments, except: [:edit]
		end
	end
end
