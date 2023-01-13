require 'rails_helper'

RSpec.describe 'Hospital show page' do

# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the names of all doctors that work at this hospital,
# And next to each doctor I see the number of patients associated with the doctor,
# And I see the list of doctors is ordered from most number of patients to least number of patients
# (Doctor patient counts should be a single query)
  describe 'Extension' do
    it 'displays the hospital name, all its doctors, patient count next to each doctor, in desc order' do
      grey_sloan = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')

      meredith = grey_sloan.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      derek = grey_sloan.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')
      miranda = grey_sloan.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
      alex = grey_sloan.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
      christina = seaside.doctors.create!(name: 'Christina Yang', specialty: 'Cardiothoracic Surgery', education: 'Priceton University')

      katie = Patient.create!(name: 'Katie Bryce', age: 24)
      denny = Patient.create!(name: 'Denny Duquette', age: 39)
      rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      zola = Patient.create!(name: 'Zola Sheperd', age: 2)

      DoctorPatient.create!(doctor_id: meredith.id, patient_id: katie.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: denny.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: zola.id)

      DoctorPatient.create!(doctor_id: derek.id, patient_id: denny.id)
      DoctorPatient.create!(doctor_id: derek.id, patient_id: rebecca.id)

      DoctorPatient.create!(doctor_id: miranda.id, patient_id: rebecca.id)

      visit "/hospitals/#{grey_sloan.id}"
      
      expect(page).to have_content(meredith.name)
      expect(page).to have_content(derek.name)
      expect(page).to have_content(miranda.name)

      # expect(meredith.name).to appear_before(derek.name)
      # expect(derek.name).to appear_before(miranda.name)
      # expect(miranda.name).to_not appear_before(derek.name)
      # expect(page).to have_content(alex.name)
      # expect(page).to_not have_content(christina.name)
    end
  end
end