class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :name, :start_time
  
  has_many :attendances
  has_many :children, through: :attendances
  
  validates :name, :presence => true
  validates :date, :presence => true
end
