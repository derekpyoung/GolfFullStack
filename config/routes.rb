Rails.application.routes.draw do
  get "/users", to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: "users#create"
  patch '/users/:id', to: "users#update"
  delete '/users/":id"', to: "users#delete"


  get "/rounds", to: 'rounds#index'
  get '/rounds/:id', to: 'rounds#show'
  post '/rounds', to: "rounds#create"
  patch '/rounds/:id', to: "rounds#update"
  delete '/rounds/":id"', to: "rounds#delete"


  get "/user_rounds", to: 'user_rounds#index'
  get '/user_rounds/:id', to: 'user_rounds#show'
  post '/user_rounds', to: "user_rounds#create"
  patch '/user_rounds/:id', to: "user_rounds#update"
  delete '/user_rounds/":id"', to: "user_rounds#delete"

  get '/current', to: "user_rounds#current_round"
  get '/current/:id', to: "user_rounds#current_round"

  get '/', to: "users#home"


end
