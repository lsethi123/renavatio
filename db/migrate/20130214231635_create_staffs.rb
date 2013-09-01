class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
    	t.string :firstname
      t.string :lastname
      t.string :name
      t.string :email
      t.string :password
      t.string :title
      t.boolean :administrator
      t.references :account
      t.timestamps
    end

    add_index :staffs, :account_id
  end
end
