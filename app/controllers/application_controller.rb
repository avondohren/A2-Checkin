class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  def authorize(min_level = 'admin')
    @user = current_user
    
    if @user.nil?
      flash[:notice] = "Please login to continue."
      redirect_to :new_login
    elsif @user.usertype < User::TYPES[min_level]
      flash[:notice] = "You do not have access to this feature."
      redirect_to :back
    end
  end
  
  def eventize
    if session[:event_id].nil?
      flash[:notice] = "Please activate an Event."
      redirect_to :events
    end
  end
    
  private
  
  # Return either `nil` or a User object.
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
end
