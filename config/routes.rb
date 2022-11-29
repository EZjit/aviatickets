Rails.application.routes.draw do
  resources :bookings, only: %i[new create show]
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'flights#index'
  
  get '/flights', to: 'flights#index'

  get 'users/id', to: 'users#show', as: 'profile'


end
