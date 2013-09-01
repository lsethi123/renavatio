class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :organization
      t.text :address1
      t.text :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :country
      t.string :fax
      t.string :tax_identifier
      t.string :primary_website

      t.timestamps
    end
  end
end
