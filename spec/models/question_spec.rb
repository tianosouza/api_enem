require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:exam) }

  describe 'scopes' do
    before do
      @exam_2023 = Exam.create!(title: 'ENEM 2023', year: 2023)
      @exam_2022 = Exam.create!(title: 'ENEM 2022', year: 2022)
      @question_2023 = Question.create!(title: 'Questão 1', index: 1, year: 2023, exam: @exam_2023)
      @question_2022 = Question.create!(title: 'Questão 2', index: 2, year: 2022, exam: @exam_2022)
    end

    it 'returns questions by year' do
      expect(Question.by_year(2023)).to include(@question_2023)
      expect(Question.by_year(2023)).not_to include(@question_2022)
    end
  end
end
