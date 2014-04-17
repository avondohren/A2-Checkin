class FamiliesController < ApplicationController

  before_filter :only => [:index, :show, :switch, :select] { |c| c.authorize 'checkin' }
  before_filter :only => [:new, :create, :edit, :update, :destroy] { |c| c.authorize 'coordinator' }
  before_filter :eventize, :only => :select
  
  # List all Families
  def index
    @families = Family.all
  end
  
  # Show generic details for an existing Family
  def show
    @family = Family.find(params[:id])
  end

  # Create a new Family through the admin console
  def new
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
  end
  
  # Save new Family to the DB
  def create
    @family = Family.new(params[:family])

    if @family.save
      flash[:notice] = "Family Successfully Created"
      
      # If there is an active event, go to :confirm page
      if session[:event_id].nil?
        redirect_to(:families)
      else
        session[:family_id] = @family.id
        redirect_to(:confirm)
      end
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  # Edit existing Family
  def edit
    @family = Family.find(params[:id])
  end
  
  def update
    @family = Family.find(params[:id])
    
    if @family.update_attributes(params[:family])
      flash[:notice] = "Family Successfully Updated"
      
      # If there is an active event, go to :confirm page
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
  
  # Delete an existing family
  def destroy
    @family = Family.find(params[:id])
    @family.delete
    flash[:notice] = "Family Deleted"
    redirect_to(:root)
  end
  
  # Deactivate active Family, used in 'admin#home'
  def switch
    session[:family_id] = nil
    redirect_to(:home)
  end
  
  # Mark a Family as Active, used in 'checkin' controller
  def select
    session[:family_id] = params[:id]
    redirect_to(:confirm)
  end
end