require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many(:doctor_patients)}
  it {should have_many(:patients).through(:doctor_patients)}

  # describe 'class methods' do
  #   xit 'can return doctor patient count, in desc order' do
  #     grey_sloan = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
  #     seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')

  #     meredith = grey_sloan.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
  #     derek = grey_sloan.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')
  #     miranda = grey_sloan.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
  #     alex = grey_sloan.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
  #     christina = seaside.doctors.create!(name: 'Christina Yang', specialty: 'Cardiothoracic Surgery', education: 'Priceton University')

  #     katie = Patient.create!(name: 'Katie Bryce', age: 24)
  #     denny = Patient.create!(name: 'Denny Duquette', age: 39)
  #     rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
  #     zola = Patient.create!(name: 'Zola Sheperd', age: 2)

  #     DoctorPatient.create!(doctor_id: meredith.id, patient_id: katie.id)
  #     DoctorPatient.create!(doctor_id: meredith.id, patient_id: denny.id)
  #     DoctorPatient.create!(doctor_id: meredith.id, patient_id: zola.id)

  #     DoctorPatient.create!(doctor_id: derek.id, patient_id: denny.id)
  #     DoctorPatient.create!(doctor_id: derek.id, patient_id: rebecca.id)

  #     DoctorPatient.create!(doctor_id: miranda.id, patient_id: rebecca.id)

  #     expect(Doctor.patient_count_desc.first).to eq(3)
  #     expect(Doctor.patient_count_desc.second).to eq(2)
  #   end
  # end
end
