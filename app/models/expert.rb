class Expert < ApplicationRecord
  has_many :courses
  has_many :newbies, through: :courses
  has_secure_password
end
