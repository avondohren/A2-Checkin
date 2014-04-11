class CheckinsController < ApplicationController
  layout "checkins"

  def new
    authorize
    eventize
    
    session[:family_id] = nil
    
    if session[:event_id].nil?
      redirect_to(:events)
    end
  end
  
  def create
    authorize
    eventize
    family = Family.find_by_phone(params[:phone])
    
    if family
        session[:family_id] = family.id
        redirect_to(:confirm)
    else
      flash[:notice] = "Invalid Phone Number"
      redirect_to(:new_checkin)
    end
  end
  
  def destroy
    authorize
    eventize
    session[:family_id] = nil
    redirect_to(:new_checkin)
  end
  
  def confirm
    authorize
    eventize
    if session[:event_id].nil?
      redirect_to(:events)
    else
      @family = Family.find(session[:family_id])
    end
  end
  
  def submit
    authorize
    eventize
    event_id = session[:event_id]
    
    params[:children].each do |p|
      kid = Child.find(p[1])
      flash[:notice] = "Checked in Successfully."
      if Attendance.where(["child_id = ? and event_id = ? and klass_name = ?", kid.id, session[:event_id], kid.klass.name]).blank?
        # there is no business for this user id
        Attendance.create({:event_id => event_id, :child_id => kid.id, :klass_name => kid.klass.name})
      end
      
    end
    
    redirect_to(:new_checkin)
  end
end