A2Checkin::Application.routes.draw do
  resources :users
  resources :logins, :only => [:new, :create, :destroy]
  resources :checkins, :only => [:new, :create, :destroy]
  resources :parents
  resources :families
  resources :children
  resources :klasses
  resources :events
  root to: 'families#index'
  
  get "checkins/confirm" => 'checkins#confirm', :as => :confirm
  post "checkins/confirm" => 'checkins#submit', :as => :confirm_submit
  get "checkins/activate/:id" => 'events#activate', :as => :activate_event
end
