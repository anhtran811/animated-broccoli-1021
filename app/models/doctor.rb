class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients, dependent: :destroy
  has_many :patients, through: :doctor_patients, dependent: :destroy

  # def self.patient_count_desc
  #   # require 'pry'; binding.pry
  #   joins(:doctor_patients).select('doctors.*, count(doctor_patients) as patient_count').group(:id).order(patient_count: :desc)
  #  
  # end
end