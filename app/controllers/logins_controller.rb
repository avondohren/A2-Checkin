class LoginsController < ApplicationController
  before_filter :only => [:destroy] { |c| c.authorize 'all' }
  layout "plain"

  # Show login prompt
  def new
  end
  
  # Validate user and set session variables
  def create
    user = User.find_by_username(params[:username])
    
    if user && user.authenticate(params[:password])
      session[:event_id] = nil
      session[:family_id] = nil
      session[:user_id] = user.id
      redirect_to(:home)
    else
      flash[:notice] = "Invalid username or password"
      redirect_to(:new_login)
    end
  end
  
  # Destroy session variable for current active user
  def destroy
    session[:user_id] = nil
    session[:family_id] = nil
    session[:event_id] = nil
    session[:tour_id] = nil
    redirect_to(:root)
  end
end