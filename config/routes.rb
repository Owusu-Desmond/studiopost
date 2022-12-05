Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: "home#index"

  root to: "posts#index"

  resources :users, only: [:new, :index] do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  get 'users/:username', to: 'users#show', as: 'user'
end
