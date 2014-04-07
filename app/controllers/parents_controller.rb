class ParentsController < ApplicationController

  def index
    authorize
    @parents = Parent.all
  end
  
  def show
    authorize
    @parent = Parent.find(params[:id])
  end

  def new
    authorize
    @parent = Parent.new
  end
  
  def create
    authorize
    @parent = Parent.new(params[:parent])
    
    if @parent.save
      flash[:notice] = "Parent Successfully Created"
      redirect_to(:root)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  def edit
    authorize
    @parent = Parent.find(params[:id])
  end
  
  def update
    authorize
    @parent = Parent.find(params[:id])
    
    if @parent.update_attributes(params[:parent])
      flash[:notice] = "Parent Successfully Updated"
      redirect_to(:root)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  def destroy
    authorize
    @parent = Parent.find(params[:id])
    
    @parent.delete
    flash[:notice] = "Parent Deleted"
    redirect_to(:root)
  end
end