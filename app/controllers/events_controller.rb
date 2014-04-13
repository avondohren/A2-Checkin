class EventsController < ApplicationController

  def index
    authorize
    
    @fut_events = Event.where(['date >= ?', Date.today]).order('date ASC')
    @past_events = Event.where(['date < ?', Date.today]).order('date DESC')
    @attendance = []
    
    @past_events[0..9].reverse.each do |e|
      @attendance << Attendance.where(:event_id => e.id).count
    end
    
  end
  
  def show
    authorize
    @event = Event.find(params[:id])
    
    @klasses = Attendance.where(:event_id => @event.id).uniq.pluck(:klass_name).sort_by{|k| k.downcase}
    
    @email = Email.new
  end

  def new
    authorize
    @event = Event.new
  end
  
  def create
    authorize
    @event = Event.new(params[:event])
    
    if @event.save
      flash[:notice] = "Event Successfully Created"
      redirect_to(:events)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  def edit
    authorize
    @event = Event.find(params[:id])
  end
  
  def update
    authorize
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event])
      flash[:notice] = "Event Successfully Updated"
      redirect_to(:events)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  def destroy
    authorize
    @event = Event.find(params[:id])
    
    @event.delete
    flash[:notice] = "Event Deleted"
    redirect_to(:root)
  end
  
  def activate
    event = Event.find(params[:id])
    
    session[:event_id] = event.id
    
    redirect_to(:events)
  end
  
  def deactivate
    session[:event_id] = nil
    
    redirect_to(:events)
  end
end