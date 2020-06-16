class Newbie < ApplicationRecord
  has_many :courses
  has_many :experts, through: :courses
  has_secure_password
end
