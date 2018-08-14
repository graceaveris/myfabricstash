Rails.application.routes.draw do
  #homepage path
  root 'welcome#index'

  #users paths
  get '/signup' => 'users#new', as: "sign_up"
  post '/users' => 'users#create'
  get "/users/:id" => "users#show", as: "user"

  #sessions paths
  get '/login' => 'sessions#new', as: "sign_in"
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: "sign_out"

  #fabrics paths
  get "/fabrics/new" => "fabrics#new", as: "new_fabrics" #This serves the form for a new listing
  post "/fabrics/new" => "fabrics#create" #This creates the listing upon submit of form

  #AUTH ROUTES // DONT TOUCH
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
