class Visit < ActiveRecord::Base
  attr_accessible :date_of, :type_of, :chief_complaint, :plan, :assessment, :date_of, :patient_id, :staff_id

  has_many :vital_signs

  belongs_to :patient
  belongs_to :staff
end