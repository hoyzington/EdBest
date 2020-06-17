class Newbie < ApplicationRecord

  has_many :courses
  has_many :experts, through: :courses
  has_secure_password

  def full_name
    self.first_name + " " + self.last_name
  end

end
