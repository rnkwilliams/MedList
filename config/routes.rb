Rails.application.routes.draw do
  resources :categories
  resources :conditions
  resources :users
  resources :medications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
