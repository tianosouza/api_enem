class QuestionSerializer < ActiveModel::Serializer
  attributes :title, :index, :year, :discipline, :context, :files, :correct_alternative, :alternatives_introduction, :alternatives
end