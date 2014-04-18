class EventsController < ApplicationController
  before_filter :only => [:index, :show] { |c| c.authorize 'volunteer' }
  before_filter :only => [:new, :create, :edit, :update, :destroy] { |c| c.authorize 'coordinator' }
  before_filter :only => [:activate, :deactivate] { |c| c.authorize 'checkin' }

  #Show all events
  def index
    @fut_events = Event.where(['date >= ?', Date.today]).order('date ASC')
    @past_events = Event.where(['date < ?', Date.today]).order('date DESC')
    @attendance = []
    @cu = current_user
    
    @past_events[0..9].reverse.each do |e|
      @attendance << Attendance.where(:event_id => e.id).count
    end
  end
  
  # Show details about a specific event
  def show
    @event = Event.find(params[:id])
    @cu = current_user
    
    @klasses = Attendance.where(:event_id => @event.id).uniq.pluck(:klass_name).sort_by{|k| k.downcase}
  end

  # Show form to create a new Event
  def new
    @event = Event.new
  end
  
  # Save new Event to DB
  def create
    @event = Event.new(params[:event])
    
    if @event.save
      flash[:notice] = "Event Successfully Created"
      redirect_to(:events)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
  
  # Show form to edit existing Event
  def edit
    @event = Event.find(params[:id])
  end
  
  # Save updates to existing event
  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event])
      flash[:notice] = "Event Successfully Updated"
      redirect_to(:events)
    else
      flash[:notice] = "Please fix errors."
      render "edit"
    end
  end
  
  # Delete an Event
  def destroy
    @event = Event.find(params[:id])
    
    @event.delete
    flash[:notice] = "Event Deleted"
    redirect_to(:root)
  end
  
  # Set an event as Active, this status is used by the 'checkin' controller
  def activate
    @prev = session[:event_id] if session[:event_id]
    session[:event_id] = params[:id]
    
    respond_to do |format|
        format.html { redirect_to(:events) }
        format.js
    end
  end
  
  # Deactivate an event, will remove the active status
  def deactivate
    session[:event_id] = nil
    @event=Event.find(params[:id])
    
    respond_to do |format|
        format.html { redirect_to(:events) }
        format.js
    end
  end
  
  def switch
    @prev = session[:event_id] if session[:event_id]
    session[:event_id] = params[:id]
    
    respond_to do |format|
        format.html { redirect_to(:events) }
        format.js
    end
  end
end