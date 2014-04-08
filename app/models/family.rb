class Family < ActiveRecord::Base
  attr_accessible :address, :alt_email, :alt_phone, :city, :email, :familyname, :phone, :state, :zipcode, :parents_attributes, :children_attributes
  
  has_many :children, :inverse_of => :family
  has_many :parents
  
  accepts_nested_attributes_for :parents, allow_destroy: true
  accepts_nested_attributes_for :children, allow_destroy: true
  
  validates :familyname, :presence => true
  validates :address, :presence => true
  validates :state, :presence => true
  validates :city, :presence => true
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  validates :email, :presence => true, :format => { :with => /.+@.+\..+/i }
  validates :alt_email, :format => { :with => /.+@.+\..+/i }, unless: "alt_email == ''"
  validates :phone, :presence => true, :uniqueness => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }
  validates :alt_phone, :uniqueness => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be in the format 402-555-1212" }, unless: "alt_phone == ''"
  
  def states
    states = [
            ['Alabama', 'AL'], 
            ['Alaska', 'AK'],
            ['Arizona', 'AZ'],
            ['Arkansas', 'AR'], 
            ['California', 'CA'], 
            ['Colorado', 'CO'], 
            ['Connecticut', 'CT'], 
            ['Delaware', 'DE'], 
            ['District Of Columbia', 'DC'], 
            ['Florida', 'FL'],
            ['Georgia', 'GA'],
            ['Hawaii', 'HI'], 
            ['Idaho', 'ID'], 
            ['Illinois', 'IL'], 
            ['Indiana', 'IN'], 
            ['Iowa', 'IA'], 
            ['Kansas', 'KS'], 
            ['Kentucky', 'KY'], 
            ['Louisiana', 'LA'], 
            ['Maine', 'ME'], 
            ['Maryland', 'MD'], 
            ['Massachusetts', 'MA'], 
            ['Michigan', 'MI'], 
            ['Minnesota', 'MN'],
            ['Mississippi', 'MS'], 
            ['Missouri', 'MO'], 
            ['Montana', 'MT'], 
            ['Nebraska', 'NE'], 
            ['Nevada', 'NV'], 
            ['New Hampshire', 'NH'], 
            ['New Jersey', 'NJ'], 
            ['New Mexico', 'NM'], 
            ['New York', 'NY'], 
            ['North Carolina', 'NC'], 
            ['North Dakota', 'ND'], 
            ['Ohio', 'OH'], 
            ['Oklahoma', 'OK'], 
            ['Oregon', 'OR'], 
            ['Pennsylvania', 'PA'], 
            ['Rhode Island', 'RI'], 
            ['South Carolina', 'SC'], 
            ['South Dakota', 'SD'], 
            ['Tennessee', 'TN'], 
            ['Texas', 'TX'], 
            ['Utah', 'UT'], 
            ['Vermont', 'VT'], 
            ['Virginia', 'VA'], 
            ['Washington', 'WA'], 
            ['West Virginia', 'WV'], 
            ['Wisconsin', 'WI'], 
            ['Wyoming', 'WY']]
  end
end
