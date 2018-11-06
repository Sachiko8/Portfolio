Rails.application.routes.draw do

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
resources :artists
resources :movies, only:[:new, :create, :edit, :update, :destroy]
resources :lives, except:[:index]
resources :places, only:[:new, :create, :edit, :update, :destroy]
resource :favorites, only:[:index, :create, :destroy]
resource :likes, only:[ :create, :destroy]
resources :posts do
  resources :comments, except:[:index, :show] do
   member do
    get :reply
   end
  end
 end

get "/top" => "tops#top"
get "/about" => "tops#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
