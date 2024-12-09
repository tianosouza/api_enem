class CreateYears < ActiveRecord::Migration[8.0]
  def change
    create_table :years do |t|
      t.string :title
      t.integer :year
      t.string :disciplines, array: true, default: []
      t.string :languages, array: true, default: []
      t.json :questions, default: []

      t.timestamps
    end
  end
end
