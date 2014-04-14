class KlassesController < ApplicationController
  before_filter :only => [:index, :show] { |c| c.authorize 'volunteer' }
  before_filter :only => [:new, :create, :edit, :update, :destroy] { |c| c.authorize 'coordinator' }
  

  def index
    authorize('volunteer')
    
    @klasses = Klass.all
  end
  
  def show
    authorize('volunteer')
    @klass = Klass.find(params[:id])
  end

  def new
    authorize('coordinator')
    
    @klass = Klass.new
  end
  
  def create
    authorize('coordinator')
    
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
    authorize('coordinator')
    
    @klass = Klass.find(params[:id])
  end
  
  def update
    authorize('coordinator')
    
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
    authorize('coordinator')
    
    @klass = Klass.find(params[:id])
    @klass.delete
    
    flash[:notice] = "Class Deleted"
    redirect_to(:root)
  end
end