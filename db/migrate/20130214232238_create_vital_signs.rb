class CreateVitalSigns < ActiveRecord::Migration
  def change
    create_table :vital_signs do |t|
      t.decimal :height
      t.decimal :weight
      t.integer :bp1
      t.integer :bp2
      t.decimal :temperature
      t.integer :pulse
      t.integer :respiratory_rate
      t.references :visit

      t.timestamps
    end

    add_index :vital_signs, :visit_id
  end
end
