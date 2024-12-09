class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :index
      t.string :year
      t.string :language
      t.string :discipline
      t.text :context
      t.string :files, array: true, default: []
      t.string :correct_alternative
      t.text :alternatives_introduction
      t.string :alternatives, array: true, default: []

      t.timestamps
    end
  end
end
