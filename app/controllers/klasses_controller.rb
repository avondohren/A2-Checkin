class KlassesController < ApplicationController
  before_filter :only => [:index, :show] { |c| c.authorize 'volunteer' }
  before_filter :only => [:new, :create, :edit, :update, :destroy] { |c| c.authorize 'coordinator' }
  
  # List all existing Klasses
  def index
    @klasses = Klass.all
  end
  
  # Show a specific Klasses details
  def show
    @klass = Klass.find(params[:id])
  end

  # Create a new Klass
  def new
    @klass = Klass.new
  end
  
  # Save new Klass to DB
  def create
    @klass = Klass.new(params[:klass])
    
    if @klass.save
      flash[:notice] = "Class Successfully Created"
      redirect_to(:klasses)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  # Show form to edit existing Klass
  def edit
    @klass = Klass.find(params[:id])
  end
  
  # Save updates to existing Klass to DB
  def update
    @klass = Klass.find(params[:id])
    
    if @klass.update_attributes(params[:klass])
      flash[:notice] = "Class Successfully Updated"
      redirect_to(:klasses)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  # Delete an existing Klass
  def destroy
    @klass = Klass.find(params[:id])
    @klass.delete
    
    flash[:notice] = "Class Deleted"
    redirect_to(:root)
  end
end