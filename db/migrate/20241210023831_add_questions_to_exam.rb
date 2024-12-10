class AddQuestionsToExam < ActiveRecord::Migration[8.0]
  def change
    add_column :exams, :questions, :string, array: true, default: []
  end
end
