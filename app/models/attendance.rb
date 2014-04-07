class Attendance < ActiveRecord::Base
  attr_accessible :child_id, :event_id, :klass_name
  
  belongs_to :child
  belongs_to :event
end
