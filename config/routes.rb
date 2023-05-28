Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end

  get 'users/omniauth_callbacks'

  resources :users do
    resources :posts, only: [:index, :new, :create]
    resources :friend_requests
    resources :friendships
  end

  resources :posts 
  resources :posts, only: [:show, :edit, :update, :destroy] 
  devise_for:users 

  # Defines the root path route ("/")
  root 'posts#index'

  devise_scope :user do
    get "/users/auth/facebook/callback" => "users/omniauth_callbacks#facebook"
  end
end
