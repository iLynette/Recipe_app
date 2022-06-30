Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :foods
  resources :recipes
  resources :food_recipes
  get '/public_recipes', to: 'public_recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resources :users, only: [:index, :show] do
  # end
end
