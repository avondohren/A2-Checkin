class UsersController < ApplicationController
  
  def index
    authorize
    @users = User.all
  end
  
  def show
    authorize
    @user = User.find(params[:id])
  end

  def new
    authorize
    @user = User.new
  end
  
  def edit
    authorize
    @user = User.find(params[:id])
  end

  def create
    authorize
    @user = User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id # "auto-login"
      flash[:notice] = "Account successfully created."
      redirect_to(:root)
    else
      render "new"
    end
  end
  
  def update
    authorize
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account Profile successfully updated."
      redirect_to(:root)
    else
      render "edit"
    end
  end

  def destroy
    authorize
    @user = User.find(params[:id])
    @user.delete
    flash[:alert] = "Account deleted."
    redirect_to(:root)
  end
end