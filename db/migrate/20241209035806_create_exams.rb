class CreateExams < ActiveRecord::Migration[8.0]
  def change
    create_table :exams do |t|
      t.string :title
      t.string :year
      t.string :disciplines, array: true, default: []
      t.string :languages, array: true, default: []

      t.timestamps
    end
  end
end
