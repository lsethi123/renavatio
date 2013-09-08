class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :type_of
      t.text :chief_complaint
      t.text :plan
      t.text :assessment
      t.date :date_of
      t.references :patient
      t.references :staff
      t.timestamps
    end

    add_index :visits, :patient_id
    add_index :visits, :staff_id
  end
end