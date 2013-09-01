class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.text :address
      t.integer :age
      t.references :account

      t.timestamps
    end

    add_index :patients, :account_id
  end
end
