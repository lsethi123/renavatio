class Admin < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password, :rank, :position
end
