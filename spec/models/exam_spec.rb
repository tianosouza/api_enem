require 'rails_helper'

RSpec.describe Exam, type: :model do
  it { should have_many(:questions) }

  describe 'scopes' do
    before do
      @exam_2023 = Exam.create!(title: 'ENEM 2023', year: 2023)
      @exam_2022 = Exam.create!(title: 'ENEM 2022', year: 2022)
    end

    it 'returns exams by year' do
      expect(Exam.by_year(2023)).to include(@exam_2023)
      expect(Exam.by_year(2023)).not_to include(@exam_2022)
    end
  end
end