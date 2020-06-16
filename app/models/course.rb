class Course < ApplicationRecord
  belongs_to :expert
  belongs_to :newbie
end
