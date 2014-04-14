class CheckinsController < ApplicationController
  before_filter { |c| c.authorize 'checkin' }
  layout "checkins"

  def new
    eventize
    
    session[:family_id] = nil
  end
  
  def create
    eventize
    
    family = Family.find_by_phone(params[:phone])
    (family = Family.find_by_alt_phone(params[:phone])) if family == nil
    
    if family
        session[:family_id] = family.id
        redirect_to(:confirm)
    else
      flash[:notice] = "Invalid Phone Number"
      redirect_to(:new_checkin)
    end
  end
  
  def destroy
    session[:family_id] = nil
    redirect_to(:new_checkin)
  end
  
  def confirm
    eventize
    
    @family = Family.where(:id => session[:family_id]).confirm
  end
  
  def submit
    eventize
    
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
  
  def new_family
    eventize
    
    @family = Family.new
    @parent = @family.parents.build
    @child = @family.children.build
    
    respond_to do |format|
      format.html {render :layout => 'plain'}
    end
  end
  
  def edit_family
    eventize
    
    @family = Family.find(params[:id])
    
    respond_to do |format|
      format.html {render :layout => 'plain'}
    end
  end
end