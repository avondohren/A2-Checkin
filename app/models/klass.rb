class Klass < ActiveRecord::Base
  attr_accessible :max_group_id, :min_group_id, :name
  
  has_many :children, :inverse_of => :klass
  
  validates :name, :uniqueness => true
  validates :max_group_id, numericality: { :greater_than_or_equal_to => :min_group_id }

  # Ages, helps select which classroom a Child belongs in
  AGES = 
    [['Newborn', 0], 
      ["1's", 1],
      ["2's", 2],
      ["3's", 3], 
      ["4's", 4], 
      ["5's", 5], 
      ['Kindergarten', 6], 
      ['1st Grade', 7], 
      ['2nd Grade', 8], 
      ['3rd Grade', 9],
      ['4th Grade', 10],
      ['5th Grade', 11], 
      ['6th Grade', 12], 
      ['7th Grade', 13], 
      ['8th Grade', 14]]
      

  # Returns an array of class names, used to help form fields make sense
  def klasses
    klasses = []
    Klass.all.each do |klass|
      klasses << [klass.name + " (" + Klass::AGES[klass.min_group_id][0] + " through " + Klass::AGES[klass.max_group_id][0] + ")",klass.id]
    end
    klasses
  end
end
