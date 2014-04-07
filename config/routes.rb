A2Checkin::Application.routes.draw do
  resources :users
  resources :logins, :only => [:new, :create, :destroy]
  resources :parents
  resources :families
  resources :children
  resources :klasses
  resources :events
  root to: 'families#index'
end
