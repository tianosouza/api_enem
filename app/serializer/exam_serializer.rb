class ExamSerializer < ActiveModel::Serializer
  attributes :title, :year, :disciplines, :questions
end