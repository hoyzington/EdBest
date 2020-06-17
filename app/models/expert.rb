class Expert < ApplicationRecord

  has_many :courses
  has_many :newbies, through: :courses
  has_secure_password

  def full_name
    self.first_name + " " + self.last_name
  end

end
