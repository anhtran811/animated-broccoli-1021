require 'rails_helper'

RSpec.describe 'Doctors show page' do
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
# - name
# - specialty
# - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

  describe 'User story 1' do
    it 'displays the doctors info (name, speciality, uni), their hospital, their patients' do
      grey_sloan = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    
      meredith = grey_sloan.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      
      katie = Patient.create!(name: 'Katie Bryce', age: 24)
      denny = Patient.create!(name: 'Denny Duquette', age: 39)
      rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      zola = Patient.create!(name: 'Zola Sheperd', age: 2)

      DoctorPatient.create!(doctor_id: meredith.id, patient_id: katie.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: denny.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: zola.id)

      visit "/doctors/#{meredith.id}"

      expect(page).to have_content(meredith.name)
      expect(page).to have_content(meredith.specialty)
      expect(page).to have_content(meredith.education)

      expect(page).to have_content(grey_sloan.name)
      expect(page).to have_content(katie.name)
      expect(page).to have_content(denny.name)
      expect(page).to have_content(zola.name)
      expect(page).to_not have_content(rebecca.name)
    end
  end
end