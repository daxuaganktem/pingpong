Rails.application.routes.draw do
  resources :games
  resources :users
  
  get 'leaderboard', to: 'users#show_top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users', to: 'users#index'
  get 'games', to: 'games#index'

end

