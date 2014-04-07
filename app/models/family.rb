class Family < ActiveRecord::Base
  attr_accessible :address, :alt_email, :alt_phone, :email, :familyname, :phone, :state, :zipcode
  
  has_many :children
  has_many :parents
  
  validates :familyname, :presence => true
  validates :address, :presence => true
  validates :state, :presence => true
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  validates :email, :uniqueness => true, :format => { :with => /.+@.+\..+/i }
  validates :alt_email, :uniqueness => true, :format => { :with => /.+@.+\..+/i }
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }
  validates :alt_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }  
  
end
