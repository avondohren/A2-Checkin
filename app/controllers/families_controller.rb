class FamiliesController < ApplicationController

  def index
    authorize
    eventize
    @families = Family.all
  end
  
  def show
    authorize
    eventize
    @family = Family.find(params[:id])
  end

  def new
    authorize
    eventize
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
  end
  
  def create
    authorize
    eventize
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
    eventize
    @family = Family.find(params[:id])
  end
  
  def update
    authorize
    eventize
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
    eventize
    @family = Family.find(params[:id])
    @family.delete
    flash[:notice] = "Family Deleted"
    redirect_to(:root)
  end
  
  def switch
    authorize
    eventize
    session[:family_id] = nil
    redirect_to(:home)
  end
  
  def select
    authorize
    eventize
    
    session[:family_id] = params[:id]
    redirect_to(:confirm)
  end
  
  def activate
    authorize
    eventize
    
    family = Family.find_by_phone(params[:phone])
    
    if family
      session[:family_id] = family.id
      redirect_to(:confirm)
    else
      flash[:notice] = "Couldn't find a match. Try again or create a new family."
      redirect_to(:select_family)
    end
  end
end