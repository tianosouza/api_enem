class Question < ApplicationRecord
  belongs_to :exam

  scope :by_year, ->(year) { joins(:exam).where(exams: { year: year }) }
end
