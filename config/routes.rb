Rails.application.routes.draw do
  get 'frrails/generate'
  get 'frrails/controller'
  get 'frrails/FriendRequests'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :users do
    resources :posts, only: [:index, :new, :create]
    resources :friend_requests
    resources :friendships
  end

  resources :posts, only: [:show, :edit, :update, :destroy] 
end
