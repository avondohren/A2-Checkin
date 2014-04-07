class Klass < ActiveRecord::Base
  attr_accessible :max_group_id, :min_group_id, :name
  
  has_many :children
  
  validates :name, :uniqueness => true
end
