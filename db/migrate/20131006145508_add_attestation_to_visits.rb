class AddAttestationToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :attestation_date, :date
  end
end
