Rails.application.routes.draw do
  resources :foods
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
  end
  root "users#index"
end
