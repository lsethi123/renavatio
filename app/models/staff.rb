class Staff < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :name, :email, :password, :title, :administrator, :account_id

  has_many :visits
  has_many :patients, through: :visits

  belongs_to :account

  def administrator?
    administrator == true
  end
end
