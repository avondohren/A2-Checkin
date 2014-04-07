class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :name, :start_time
end
