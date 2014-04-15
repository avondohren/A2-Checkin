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
    if params[:phone] == ""
      respond_to do |format|
        flash[:notice] = "Invalid Phone Number."
        format.html { redirect_to(:new_checkin) and return}
        format.js { render 'wrong_pw' and return}
      end
    end
    
    @family = Family.find_by_phone(params[:phone])
    
    puts "Family after phone: #{@family}"
    
    (@family = Family.find_by_alt_phone(params[:phone])) if @family.nil?
    
    puts "Family after alt_phone: #{@family}"
    
    respond_to do |format|
      if @family
        session[:family_id] = @family.id
        @family = Family.confirm(@family.id)
        format.html { redirect_to(:confirm) }
        format.js
      else
        flash[:notice] = "Invalid Phone Number."
        format.html { redirect_to(:new_checkin) }
        format.js { render 'wrong_pw'}
      end
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
    @family = Family.confirm(session[:family_id])
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
    
    session[:family_id] = nil
    flash[:notice] = "Checked in Successfully."
    
    respond_to do |format|
        format.html { redirect_to(:new_checkin) }
        format.js
    end
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