class CheckinsController < ApplicationController
  before_filter { |c| c.authorize 'checkin' }
  before_filter :eventize, :except => :destroy
  layout "checkins"

  # Prompt for phone number
  def new
    session[:family_id] = nil
  end
  
  # Search for the phone number profided and sets result to active family
  def create
    family = Family.find_by_phone(params[:phone])
    (family = Family.find_by_alt_phone(params[:phone])) if family.nil?
    
    if family
        session[:family_id] = family.id
        redirect_to(:confirm)
    else
      flash[:notice] = "Invalid Phone Number"
      redirect_to(:new_checkin)
    end
  end
  
  # Remove the session variable for family_id
  def destroy
    session[:family_id] = nil
    redirect_to(:new_checkin)
  end
  
  # Show children for the active family
  def confirm
    # See Family model for definition of .confirm Named Scope
    @family = Family.where(:id => session[:family_id]).confirm
  end
  
  # Checkin selected children to active event
  def submit
    event_id = session[:event_id]
    
    params[:children].each do |p|
      kid = Child.find(p[1])
      
      # Ignore if Child is already checked into this Event
      if Attendance.where(["child_id = ? and event_id = ? and klass_name = ?", kid.id, session[:event_id], kid.klass.name]).blank?
        
        Attendance.create({:event_id => event_id, :child_id => kid.id, :klass_name => kid.klass.name})
      end
    end
    
    flash[:notice] = "Checked in Successfully."
    redirect_to(:new_checkin)
  end
  
  # Display form to create new family
  def new_family
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
    
    respond_to do |format|
      format.html {render :layout => 'plain'}
    end
  end
  
  # Display form to edit active family
  def edit_family
    @family = Family.find(params[:id])
    
    respond_to do |format|
      format.html {render :layout => 'plain'}
    end
  end
end