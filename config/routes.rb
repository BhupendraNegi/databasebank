Rails.application.routes.draw do
  resources :bn_nominal_rolls
  root 'main#index'
  devise_for :users
  resources :home, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  match '/home/*path', to: 'home#index', via: :all
  match '/', to: 'main#index', via: :all
end
