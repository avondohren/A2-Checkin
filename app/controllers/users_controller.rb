class UsersController < ApplicationController
  before_filter :only => [:index, :show, :edit, :update] { |c| c.authorize 'volunteer' }
  before_filter :only => [:new, :create, :destroy] { |c| c.authorize 'coordinator' }
  
  
  def index
    @users = User.where("usertype < 99")
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def edit
    if params[:id].to_i == session[:user_id].to_i || current_user.usertype > User::TYPES['coordinator']
      @user = User.find(params[:id])
    else
      flash[:notice] = "You cannot edit another users account"
      redirect_to :back
    end
  end

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

  def destroy
    @user = User.find(params[:id])
    @user.delete
    flash[:alert] = "Account deleted."
    redirect_to(:root)
  end
end