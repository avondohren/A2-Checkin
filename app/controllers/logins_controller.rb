class LoginsController < ApplicationController
  before_filter :only => [:destroy] { |c| c.authorize 'all' }
  layout "plain"

  def new
  end
  
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
  
  def destroy
    session[:user_id] = nil
    redirect_to(:root)
  end
end