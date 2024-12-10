class Exam < ApplicationRecord
  has_many :questions

  scope :by_year, ->(year) { where(year: year) }

  def to_s
    title
  end
end
