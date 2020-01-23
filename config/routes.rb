Rails.application.routes.draw do
  root 'static#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :categories
  resources :conditions
  resources :users
  resources :medications do
    resources :conditions, only: [:new, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
