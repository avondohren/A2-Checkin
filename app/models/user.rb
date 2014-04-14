class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :usertype
  
  has_secure_password
  
  validates :username, :uniqueness => true, :format => { :with => /^[a-zA-Z0-9_]+$/ }
  validates :usertype, :presence => true
  
  # Users have types as described below. The value is stored on the user as type_id. This allows logic to be used like user.type_id > 30. 
  TYPES = 
    {'admin' => 99,
    'coordinator' => 75,
    'pastor' => 60,
    'checkin' => 40,
    'volunteer' => 25,
    'all' => 0}
end
