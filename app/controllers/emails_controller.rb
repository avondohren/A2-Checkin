class EmailsController < ApplicationController
  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.joins(:event).select("emails.*, events.name as ename").order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.json
  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email }
    end
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(params[:email])
    @event = Event.find(@email.event_id)

    respond_to do |format|
      if @email.save
        
        emails = Event.where(:id => @event.id).joins(:children => :family).pluck("families.email as femail").uniq
        alt_emails = Event.where(:id => @event.id).joins(:children => :family).pluck("families.alt_email as femail").uniq
        
        puts (emails + alt_emails).compact
        
        (emails + alt_emails).compact.each do |e|
          SiteMailer.recap(e,@email).deliver
        end
        
        format.html { redirect_to event_path(@email.event_id), notice: 'Email was successfully created.' }
        format.json { render json: @email, status: :created, location: @email }
      else
        format.html { render action: "new" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end
end
