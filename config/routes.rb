Rails.application.routes.draw do
  resources :bn_sports_teams
  resources :bn_nominal_rolls do
    resources :bn_lmc_pers
    resources :coy_leave_details
    resources :bn_punishment_pers
    resources :ere_details
    resources :pers_in_mhs
    resources :bn_sports_teams
  end

  root 'main#index'
  devise_for :users
  resources :home, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  match '/home/*path', to: 'home#index', via: :all
  match '/', to: 'main#index', via: :all
end
