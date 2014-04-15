class EmailsController < ApplicationController
  before_filter :only => [:index, :show] { |c| c.authorize 'pastor' }
  before_filter :only => [:new, :create] { |c| c.authorize 'coordinator' }
  
  
  # list past emails in DESC order
  def index
    @emails = Email.joins(:event).select("emails.*, events.name as ename").order('created_at DESC')
  end

  # Show contents of specific email
  def show
    @email = Email.find(params[:id])
  end

  # Create new email
  def new
    @email = Email.new
  end

  # Send email to each family that attended the event
  def create
    @email = Email.new(params[:email])
    @event = Event.find(@email.event_id)

    if @email.save
      emails = @event.family_attr_list("email")
      alt_emails = @event.family_attr_list("alt_email")
      
      puts "Emails: " + emails.to_s
      puts "AltEmails: #{alt_emails}"
      
      (emails + alt_emails).uniq.compact.reject(&:empty?).each do |e|
        SiteMailer.recap(e,@email).deliver
      end
      
      flash[:notice] = 'Email was successfully created.'
      redirect_to event_path(@email.event_id)
    else
      flash[:notice] = "Please fix errors."
      render "new"
    end
  end
end
