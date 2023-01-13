require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
    it { should have_many(:hospitals).through(:doctors) }
  end

  describe 'class methods' do 
    it 'can list adult patients name in alphabetical order' do
      katie = Patient.create!(name: 'Katie Bryce', age: 24)
      denny = Patient.create!(name: 'Denny Duquette', age: 39)
      rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      zola = Patient.create!(name: 'Zola Sheperd', age: 2)

      expect(Patient.adult_names_alphabetically.sort).to eq([denny.name, katie.name, rebecca.name].sort)
    end
  end
end