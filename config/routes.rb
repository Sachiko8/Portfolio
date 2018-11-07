Rails.application.routes.draw do

  root :to => 'tops#top'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

resources :users, only:[:index, :show, :edit, :update, :destroy]

resources :artists do
	resource :favorites, only:[:create, :destroy]
	resources :movies, only:[:new, :create, :edit, :update, :destroy]
	resources :thumnails, only:[:create, :update, :destroy]
	resources :lives, except:[:index] do
		resources :posts do
			resource :likes, only:[ :create, :destroy]
			resources :comments, except:[:index, :show] do
				member do
					get :reply
				end
			end
		end
	end
end

get "/favorites" => "favorites#index"

resources :places, only:[:new, :create, :edit, :update, :destroy]

get "/top" => "tops#top"
get "/about" => "tops#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
