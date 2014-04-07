class EventsController < ApplicationController

  def index
    authorize
    @events = Event.all
  end
  
  def show
    authorize
    @event = Event.find(params[:id])
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
end