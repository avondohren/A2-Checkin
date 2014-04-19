class Child < ActiveRecord::Base
  attr_accessible :allergies, :birthday, :concerns, :family_id, :firstname, :klass_id, :lastname, :group_id
  attr_accessor :group_id
  
  before_validation :assign_class
  
  belongs_to :family
  belongs_to :klass
  has_many :attendances
  has_many :events, through: :attendances
  has_many :parents, through: :family
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :birthday, :presence => true
  validates_presence_of :klass_id
  
  # Returns a string concatenating the first and last names
  def name
    firstname + " " + lastname
  end
  
  def parent_names
    array = []
    
    self.parents.each do |p|
      array << p.firstname
    end
    
    array.join(", ")
  end
  
  # Assigns an appropriate classroom based on the group_id selected during creation
  def assign_class
    if self.group_id
      age = self.group_id
    
      Klass.all.each do |c|
        if age.to_i >= c.min_group_id && age.to_i <= c.max_group_id
          self.klass_id = c.id
          break
        end
      end
    else
      puts "Skipping klass assignment"
    end
  end

end
