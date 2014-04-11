class FamiliesController < ApplicationController

  def index
    authorize
    @families = Family.all
  end
  
  def show
    authorize
    @family = Family.find(params[:id])
  end

  def new
    authorize
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
  end
  
  def create
    authorize
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
    authorize
    @family = Family.find(params[:id])
  end
  
  def update
    authorize
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
    authorize
    @family = Family.find(params[:id])
    @family.delete
    flash[:notice] = "Family Deleted"
    redirect_to(:root)
  end
  
  def switch
    authorize
    session[:family_id] = nil
    redirect_to(:home)
  end
  
  def select
    authorize
    eventize
    
    session[:family_id] = params[:id]
    redirect_to(:confirm)
  end
end