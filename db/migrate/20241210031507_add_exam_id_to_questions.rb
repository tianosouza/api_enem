class AddExamIdToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :exam_id, :integer
  end
end
