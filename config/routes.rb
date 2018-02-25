Rails.application.routes.draw do
  
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  root to: 'tasks#index'

  resources :tasks
  
  # get 'users/create'
  # get 'users/new'
  resources :users, only: [:new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end