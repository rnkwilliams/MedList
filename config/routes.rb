Rails.application.routes.draw do
  get 'sessions/new'
  root 'static#home'

  get '/signup', to: 'signup#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :categories
  resources :conditions
  resources :users
  resources :medications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
