class CheckinsController < ApplicationController

  def new
  end
  
  def create
    family = Family.find_by_phone(params[:phone])
    
    if family
        session[:family_id] = family.id
        redirect_to(:confirm)
    else
      flash[:notice] = "Invalid email address or password"
      redirect_to(:new_checkin)
    end
  end
  
  def destroy
    authorize
    session[:family_id] = nil
    redirect_to(:new_checkin)
  end
  
  def confirm
    @children = Family.find(session[:family_id]).children
  end
  
  def submit
    event_id = session[:event_id]
    
    params[:children].each do |p|
      kid = Child.find(p[1])
      
      Attendance.create({:event_id => event_id, :child_id => kid.id, :klass_name => kid.klass.name})
    end
    
    redirect_to(:families)
  end
end