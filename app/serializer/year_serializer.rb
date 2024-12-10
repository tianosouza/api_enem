class YearSerializer < ActiveModel::Serializer
  attributes :title, :year, :disciplines, :languages, :questions
end
