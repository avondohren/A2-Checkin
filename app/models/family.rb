class Family < ActiveRecord::Base
  attr_accessible :address, :alt_email, :alt_phone, :email, :familyname, :phone, :state, :zipcode
end
