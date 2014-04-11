class Event < ActiveRecord::Base
  attr_accessible :date, :duration, :name, :start_time, :attendances_attributes
  
  has_many :attendances
  has_many :children, through: :attendances
  has_many :emails
  
  validates :name, :presence => true
  validates :date, :presence => true
end
