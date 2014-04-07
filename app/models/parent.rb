class Parent < ActiveRecord::Base
  attr_accessible :family_id, :firstname, :lastname, :relationship
  
  belongs_to :family
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :relationship, :presence => true
end
