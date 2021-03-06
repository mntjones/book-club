Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  	resources :reviews, only: [:edit, :update, :destroy]
  end
  
  resources :books do
    resources :reviews, only: [:new, :create, :show]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/auth/github/callback", to: "sessions#create"

  get "/highest_rated", to: "books#highest_rated"


  root to: "application#welcome"
end
