class FamiliesController < ApplicationController

  before_filter :only => [:index, :show, :switch, :select] { |c| c.authorize 'checkin' }
  before_filter :only => [:new, :create, :edit, :update, :destroy] { |c| c.authorize 'coordinator' }
  

  def index
    @families = Family.all
  end
  
  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
  end
  
  def create
    @family = Family.new(params[:family])

    if @family.save
      flash[:notice] = "Family Successfully Created"
      session[:family_id] = @family.id
      redirect_to(:confirm)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  def edit
    @family = Family.find(params[:id])
  end
  
  def update
    @family = Family.find(params[:id])
    
    if @family.update_attributes(params[:family])
      flash[:notice] = "Family Successfully Updated"
      if session[:event_id].nil?
        redirect_to(:families)
      else
        session[:family_id] = @family.id
        redirect_to(:confirm)
      end
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  def destroy
    @family = Family.find(params[:id])
    @family.delete
    flash[:notice] = "Family Deleted"
    redirect_to(:root)
  end
  
  def switch
    session[:family_id] = nil
    redirect_to(:home)
  end
  
  def select
    eventize
    
    session[:family_id] = params[:id]
    redirect_to(:confirm)
  end
end