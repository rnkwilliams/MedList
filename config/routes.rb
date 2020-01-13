Rails.application.routes.draw do
  get 'sessions/new'
  root 'static#home'

  get '/signup', to: 'signup#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' to: 'sessions#destroy'

  resources :categories
  resources :conditions
  resources :users, only:[:new, :create, :show]
  resources :medications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
