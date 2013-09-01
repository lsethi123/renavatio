class Account < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :fax, :id, :organization, :phone, :postal_code, :primary_website, :state, :tax_identifier

  has_many :staff
end
