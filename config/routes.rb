Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/signout', to: "sessions#destroy"
  get '/signup', to: "users#new"
  post '/dashboard', to: "users#create"
  patch '/dashboard', to: "users#update"
  get '/dashboard', to: "users#show"
  get '/items/all', to: "items#index"
  get 'items/new', to: "items#new"
  get '/cart', to: "carts#index"
  post '/checkout', to: "carts#checkout"

  resources :users, only: [:edit] do
    resources :addresses, only: [:edit, :update]
  end

  resources :carts, only: [:new, :create, :edit, :update]

  resources :categories, only: [:show] do
    resources :items, except: [:index, :new] do
      member do
        post 'add_to_cart'
      end
      resources :reviews, only: [:index]
    end
  end
end
