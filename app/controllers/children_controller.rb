class ChildrenController < ApplicationController

  def index
    authorize
    @children = Child.all
  end
  
  def show
    authorize
    @child = Child.find(params[:id])
  end

  def new
    authorize
    @child = Child.new
  end
  
  def create
    authorize
    @child = Child.new(params[:child])
    
    if @child.save
      flash[:notice] = "Child Successfully Created"
      redirect_to(:root)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  def edit
    authorize
    @child = Child.find(params[:id])
  end
  
  def update
    authorize
    @child = Child.find(params[:id])
    
    if @child.update_attributes(params[:child])
      flash[:notice] = "Child Successfully Updated"
      redirect_to(:root)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  def destroy
    authorize
    @child = Child.find(params[:id])
    
    @child.delete
    flash[:notice] = "Child Deleted"
    redirect_to(:root)
  end
end