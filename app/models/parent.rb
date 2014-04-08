class Parent < ActiveRecord::Base
  attr_accessible :family_id, :firstname, :lastname, :relationship
  
  belongs_to :family
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :relationship, :presence => true
  
  def name
    firstname + " " + lastname
  end
  
  RELATIONS = 
    [["Mother",0],
    ["Father",1],
    ["Grandparent",2],
    ["Aunt",3],
    ["Uncle",4],
    ["Other",99]]
end
