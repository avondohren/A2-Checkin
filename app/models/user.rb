class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  
  has_secure_password
  
  validates :username, :uniqueness => true, :format => { :with => /^[a-zA-Z0-9_]+$/ }
end
