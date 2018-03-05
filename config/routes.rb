Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/signout', to: "sessions#destroy"
  get '/signup', to: "users#new"
  post '/dashboard', to: "users#create"
  get '/dashboard', to: "users#show"

  resources :users, only: [:edit, :update]
  resources :carts, only: [:show, :edit, :update]
  resources :categories do
    resources :items do
      resources :reviews, only: [:index]
    end
  end
end
