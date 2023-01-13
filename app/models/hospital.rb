class Hospital < ApplicationRecord
  has_many :doctors, dependent: :destroy
  has_many :patients, through: :doctors, dependent: :destroy
end
