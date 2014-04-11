A2Checkin::Application.routes.draw do
  root to: 'admins#home'
  get "admins" => 'admins#home', :as => :home
  
  get "checkins/confirm" => 'checkins#confirm', :as => :confirm
  post "checkins/confirm" => 'checkins#submit', :as => :confirm_submit
  get "checkins/new_family" => 'checkins#new_family', :as => :new_family_checkin
  get "checkins/edit_family/:id" => 'checkins#edit_family', :as => :edit_family_checkin
  resources :checkins, :only => [:new, :create, :destroy]
  
  get "events/activate/:id" => 'events#activate', :as => :activate_event
  get "events/deactivate" => 'events#deactivate', :as => :deactivate_event
  resources :events
  
  resources :klasses
  
  resources :emails, :only => [:index, :show, :new, :create]
  
  get "families/switch" => 'families#switch', :as => :switch_family
  get "families/select/:id" => 'families#select', :as => :select_family
  post "families/activate" => 'families#activate', :as => :activate_family
  resources :families
  
  resources :users
  resources :logins, :only => [:new, :create, :destroy]
end
