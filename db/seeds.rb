# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
DoctorPatient.destroy_all
Hospital.destroy_all

grey_sloan = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')

meredith = grey_sloan.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University')
derek = grey_sloan.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', education: 'University of Pennsylvania')
miranda = grey_sloan.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', education: 'Stanford University')
alex = grey_sloan.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
christina = seaside.doctors.create!(name: 'Christina Yang', specialty: 'Cardiothoracic Surgery', education: 'Priceton University')
teddy = seaside.doctors.create!(name: 'Teddy Altman', specialty: 'Trauma Surgery', education: 'Cornell University')

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







