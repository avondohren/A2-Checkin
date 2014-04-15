class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :name, :start_time, :attendances_attributes
  
  has_many :attendances
  has_many :children, through: :attendances
  has_many :emails
  
  validates :name, :presence => true
  validates :date, :presence => true
  
  # Get list of unique attribute values from an Event's Families
  #
  # id - Event ID to limit results to
  # attr - string that contains the field you are looking for
  #
  # Examples
  #
  #      emails = Event.email_addresses(@event.id, 'email')
  #
  #      alt_emails = Event.email_addresses(@event.id, 'alt_email')
  #
  # Returns Array of unique field entries
  def family_attr_list(attr)
    Event.where(:id => self.id).joins(:children => :family).pluck("families.#{attr} as fam_#{attr}").uniq
  end
end
