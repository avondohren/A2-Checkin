class LoginsController < ApplicationController
  layout "checkins"

  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    
    if user && user.authenticate(params[:password])
      session[:event_id] = nil
      session[:family_id] = nil
      session[:user_id] = user.id
      redirect_to(:users)
    else
      flash[:notice] = "Invalid username or password"
      redirect_to(:new_login)
    end
  end
  
  def destroy
    authorize
    session[:user_id] = nil
    redirect_to(:root)
  end
end