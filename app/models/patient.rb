class Patient < ActiveRecord::Base
  attr_accessible :address, :age, :birthday, :firstname, :lastname, :account_id

  has_many :visits
  has_many :staff, through: :visits

  belongs_to :account
end
