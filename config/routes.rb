Rails.application.routes.draw do
  # Root and authentication routes
  root "users#home"

  get '/signup', to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  # RESTful resources
  resources :users
  resources :rounds
  resources :user_rounds

  # Custom route for viewing all players in a specific round
  get '/current/:id', to: 'user_rounds#current_round', as: 'current_round'
end
