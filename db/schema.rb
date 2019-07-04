# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_02_084450) do

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "question_id"
    t.string "answer"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "exam_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "subject_id"
    t.string "name"
    t.integer "status"
    t.integer "limited_time"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "question_id"
    t.integer "answer_id"
    t.integer "user_exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "subject_id"
    t.text "content"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.integer "doing_time"
    t.integer "status"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role"
    t.string "remember_digest"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
