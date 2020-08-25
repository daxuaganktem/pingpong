Rails.application.routes.draw do
  devise_for :users
  resources :games
  resources :users
  
  get 'leaderboard', to: 'users#show_top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'users', to: 'users#index'
  get 'games', to: 'games#index'

  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end

end

