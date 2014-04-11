class Family < ActiveRecord::Base
  attr_accessible :address, :alt_email, :alt_phone, :city, :email, :familyname, :phone, :state, :zipcode, :parents_attributes, :children_attributes
  
  has_many :children
  has_many :parents
  
  accepts_nested_attributes_for :parents, allow_destroy: true
  accepts_nested_attributes_for :children, allow_destroy: true
  
  validates :familyname, :presence => true
  validates :address, :presence => true
  validates :state, :presence => true
  validates :city, :presence => true
  validates_format_of :zipcode, :with => /^\d{5}?$/, :message => "should be in the form 12345"
  validates :email, :presence => true, :format => { :with => /.+@.+\..+/i }
  validates :alt_email, :format => { :with => /.+@.+\..+/i }, unless: "alt_email == ''"
  validates :phone, :presence => true, :uniqueness => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }
  validates :alt_phone, :uniqueness => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }, unless: "alt_phone == ''"
  
  def states
    states = [
            ['AL', 'AL'], 
            ['AK', 'AK'],
            ['AZ', 'AZ'],
            ['AR', 'AR'], 
            ['CA', 'CA'], 
            ['CO', 'CO'], 
            ['CT', 'CT'], 
            ['DE', 'DE'], 
            ['DC', 'DC'], 
            ['FL', 'FL'],
            ['GA', 'GA'],
            ['HI', 'HI'], 
            ['ID', 'ID'], 
            ['IL', 'IL'], 
            ['IN', 'IN'], 
            ['IA', 'IA'], 
            ['KS', 'KS'], 
            ['KY', 'KY'], 
            ['LA', 'LA'], 
            ['ME', 'ME'], 
            ['MD', 'MD'], 
            ['MA', 'MA'], 
            ['MI', 'MI'], 
            ['MN', 'MN'],
            ['MS', 'MS'], 
            ['MO', 'MO'], 
            ['MT', 'MT'], 
            ['NE', 'NE'], 
            ['NV', 'NV'], 
            ['NH', 'NH'], 
            ['NJ', 'NJ'], 
            ['NM', 'NM'], 
            ['NY', 'NY'], 
            ['NC', 'NC'], 
            ['ND', 'ND'], 
            ['OH', 'OH'], 
            ['OK', 'OK'], 
            ['OR', 'OR'], 
            ['PA', 'PA'], 
            ['RI', 'RI'], 
            ['SC', 'SC'], 
            ['SD', 'SD'], 
            ['TN', 'TN'], 
            ['TX', 'TX'], 
            ['UT', 'UT'], 
            ['VT', 'VT'], 
            ['VA', 'VA'], 
            ['WA', 'WA'], 
            ['WV', 'WV'], 
            ['WI', 'WI'], 
            ['WY', 'WY']]
  end
end
