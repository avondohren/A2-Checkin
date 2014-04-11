class Child < ActiveRecord::Base
  attr_accessible :allergies, :birthday, :concerns, :family_id, :firstname, :klass_id, :lastname, :group_id
  attr_accessor :group_id
  
  before_validation :assign_class
  
  belongs_to :family
  belongs_to :klass
  has_many :attendances
  has_many :events, through: :attendances
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :birthday, :presence => true
  validates_presence_of :klass_id
  
  def name
    firstname + " " + lastname
  end
  
  def assign_class
    age = self.group_id
    
    Klass.all.each do |c|
      if age.to_i >= c.min_group_id && age.to_i <= c.max_group_id
        self.klass_id = c.id
        break
      end
    end
  end

end
