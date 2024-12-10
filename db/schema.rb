# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_10_031507) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "exams", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "disciplines", default: [], array: true
    t.string "languages", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "questions", default: [], array: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "index"
    t.string "year"
    t.string "language"
    t.string "discipline"
    t.text "context"
    t.string "files", default: [], array: true
    t.string "correct_alternative"
    t.text "alternatives_introduction"
    t.string "alternatives", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exam_id"
  end

  create_table "years", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "disciplines", default: [], array: true
    t.string "languages", default: [], array: true
    t.json "questions", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
