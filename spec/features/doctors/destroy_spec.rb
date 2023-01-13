require 'rails_helper'

RSpec.describe 'Delete patient from doctor caseload' do
  # As a visitor
  # When I visit a Doctor's show page
  # Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed
  # And when I visit a different doctor's show page that is caring for the same patient,
  # Then I see that the patient is still on the other doctor's caseload

  describe 'User story 2' do
    it 'has a button next to each patient to remove that patient from doctor caseload' do
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

      within("#patient-#{katie.id}") do
        expect(page).to have_content(katie.name)
        expect(page).to have_button("Delete #{katie.name} from caseload")
      end
      
      within("#patient-#{denny.id}") do
        expect(page).to have_content(denny.name)
        expect(page).to have_button("Delete #{denny.name} from caseload")
        expect(page).to_not have_content(katie.name)
      end
      
      within("#patient-#{zola.id}") do
        expect(page).to have_content(zola.name)
        expect(page).to have_button("Delete #{zola.name} from caseload")
        expect(page).to_not have_content(denny.name)
      end
    end

    it 'can remove patient from caseload when button is pressed, and redirect to doctors show' do
      grey_sloan = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    
      meredith = grey_sloan.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
      derek = grey_sloan.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')

      katie = Patient.create!(name: 'Katie Bryce', age: 24)
      denny = Patient.create!(name: 'Denny Duquette', age: 39)
      rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      zola = Patient.create!(name: 'Zola Sheperd', age: 2)

      DoctorPatient.create!(doctor_id: meredith.id, patient_id: katie.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: denny.id)
      DoctorPatient.create!(doctor_id: meredith.id, patient_id: zola.id)

      DoctorPatient.create!(doctor_id: derek.id, patient_id: denny.id)
      DoctorPatient.create!(doctor_id: derek.id, patient_id: rebecca.id)

      visit "/doctors/#{meredith.id}"

      within("#patient-#{katie.id}") do
        expect(page).to have_content(katie.name)
        expect(page).to_not have_content(denny.name)
        expect(page).to have_button("Delete #{katie.name} from caseload")    
      end
      
      within("#patient-#{denny.id}") do
        expect(page).to have_content(denny.name)
        expect(page).to_not have_content(katie.name)
        expect(page).to have_button("Delete #{denny.name} from caseload")

        click_button("Delete #{denny.name} from caseload") 

        expect(current_path).to eq("/doctors/#{meredith.id}")
      end
      
      within("#patient-#{zola.id}") do
        expect(page).to have_content(zola.name)
        expect(page).to have_button("Delete #{zola.name} from caseload")
        expect(page).to_not have_content(denny.name)
      end
      expect(page).to_not have_content(denny.name)

      visit "/doctors/#{derek.id}"

      within("#patient-#{denny.id}") do
        expect(page).to have_content(denny.name)
      
        expect(page).to have_button("Delete #{denny.name} from caseload")
      end
    end
  end
end