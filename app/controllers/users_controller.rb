class UsersController < ApplicationController
  before_filter :only => [:index, :show, :edit, :update] { |c| c.authorize 'volunteer' }
  before_filter :only => [:new, :create, :destroy] { |c| c.authorize 'coordinator' }
  
  # Show Users that are not admins
  def index
    @users = User.where("usertype < 99")
  end
  
  # Show details for a specific User
  def show
    @user = User.find(params[:id])
  end

  # Create a new User
  def new
    @user = User.new
  end
  
  # Allow 'coordinator's or self to edit a User profile
  def edit
    if params[:id].to_i == session[:user_id].to_i || current_user.usertype > User::TYPES['coordinator']
      @user = User.find(params[:id])
    else
      flash[:notice] = "You cannot edit another users account"
      redirect_to :back
    end
  end

  # Save new User to the DB
  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id # "auto-login"
      flash[:notice] = "Account successfully created."
      redirect_to(:root)
    else
      render "new"
    end
  end
  
  # Save updates to a User to the DB
  def update
    if params[:id].to_i == session[:user_id].to_i || current_user.usertype >= User::TYPES['coordinator']
      @user = User.find(params[:id])
      
      if @user.update_attributes(params[:user])
        flash[:notice] = "Account Profile successfully updated."
        redirect_to(:root)
      else
        render "edit"
      end
    else
      flash[:notice] = "You cannot edit another users account"
      redirect_to :back
    end
  end
  
  # Delete a User
  def destroy
    @user = User.find(params[:id])
    @user.delete
    flash[:alert] = "Account deleted."
    redirect_to(:root)
  end
end