class Visit < ActiveRecord::Base
  attr_accessible :date_of, :type_of, :chief_complaint, :plan, :assessment, :patient_id, :staff_id, :attestation_date

  has_many :vital_signs

  belongs_to :patient
  belongs_to :staff

  validates :chief_complaint, presence: { message: "Deceased" }
end