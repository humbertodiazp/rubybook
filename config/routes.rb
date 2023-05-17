Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  resources :users do
    resources :posts, only: [:index, :new, :create]
  end

  resources :posts, only: [:show, :edit, :update, :destroy] 
end
