class ExamSerializer < ActiveModel::Serializer
  attributes :title, :year, :disciplines
end