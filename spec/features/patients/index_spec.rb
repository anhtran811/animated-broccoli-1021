require 'rails_helper'

RSpec.describe 'Patients Index Page' do

# As a visitor
# When I visit the patient index page
# I see the names of all adult patients (age is greater than 18),
# And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)
  describe 'User story 3' do
    it 'lists all adult patients, alphabetically' do
      katie = Patient.create!(name: 'Katie Bryce', age: 24)
      denny = Patient.create!(name: 'Denny Duquette', age: 39)
      rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      zola = Patient.create!(name: 'Zola Sheperd', age: 2)

      visit '/patients'

      expect(denny.name).to appear_before(katie.name)
      expect(katie.name).to appear_before(rebecca.name)
      expect(rebecca.name).to_not appear_before(denny.name)
      expect(page).to_not have_content(zola.name)
    end
  end
end