class Parent < ActiveRecord::Base
  attr_accessible :family_id, :firstname, :lastname, :relationship
  
  belongs_to :family
  has_many :children, through: :family
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :relationship, :presence => true
  
  # Returns a string concatenating the first and last names
  def name
    firstname + " " + lastname
  end
  
  # Array of relation types, used to help form fields make sense
  RELATIONS = 
    [["Mother",0],
    ["Father",1],
    ["Grandparent",2],
    ["Aunt",3],
    ["Uncle",4],
    ["Other",99]]
end
