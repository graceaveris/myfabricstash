Rails.application.routes.draw do
  #homepage path
  root 'welcome#index'

  #users paths
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #sessions paths
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logou’' => 'sessions#destroy'

end
