class Child < ActiveRecord::Base
  attr_accessible :allergies, :birthday, :concerns, :family_id, :firstname, :group_id, :klass_id, :lastname
  
  belongs_to :family
  belongs_to :klass
  has_may :attendances
  has_many :events, through: :attendances
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :birthday, :presence => true
  validates :group_id, :presence => true
end
