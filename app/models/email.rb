class Email < ActiveRecord::Base
  attr_accessible :content, :event_id, :subject
  
  belongs_to :event
end
