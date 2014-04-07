class User < ActiveRecord::Base
  attr_accessible :password_digest, :username
end
