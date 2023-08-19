Rails.application.routes.draw do
  resources :bn_nominal_rolls do
    collection do
      get :coy_nominal_roll
      get :coy_leave_detail
      get :bn_lmc_pers
    end
    resources :bn_lmc_pers
    resources :coy_leave_details
    resources :bn_punishment_pers
    resources :ere_details
    resources :pers_in_mhs
    resources :bn_sports_teams
    resources :army_courses
    resources :att_pers
    resources :indl_veh_details
    resources :indl_details
    resources :awards_and_achievements
    resources :cor_drinker_non_drinkers
    resources :leave_states
    resources :max_health_reports
    resources :bn_family_member_details
  end

  root 'main#index'
  devise_for :users
  resources :home, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  match '/home/*path', to: 'home#index', via: :all
  match '/', to: 'main#index', via: :all
end
