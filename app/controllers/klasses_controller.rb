class KlassesController < ApplicationController

  def index
    authorize
    @klasses = Klass.all
  end
  
  def show
    authorize
    @klass = Klass.find(params[:id])
  end

  def new
    authorize
    @klass = Klass.new
  end
  
  def create
    authorize
    @klass = Klass.new(params[:klass])
    
    if @klass.save
      flash[:notice] = "Class Successfully Created"
      redirect_to(:klasses)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  def edit
    authorize
    @klass = Klass.find(params[:id])
  end
  
  def update
    authorize
    @klass = Klass.find(params[:id])
    
    if @klass.update_attributes(params[:klass])
      flash[:notice] = "Class Successfully Updated"
      redirect_to(:klasses)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  def destroy
    authorize
    @klass = Klass.find(params[:id])
    
    @klass.delete
    flash[:notice] = "Class Deleted"
    redirect_to(:root)
  end
end