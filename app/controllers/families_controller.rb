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
  end
  
  def create
    authorize
    @family = Family.new(params[:family])
    
    if @family.save
      flash[:notice] = "Family Successfully Created"
      redirect_to(:root)
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
      redirect_to(:root)
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
  
end