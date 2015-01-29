# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150129193958) do

  create_table "professor_settings", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.boolean  "approval_status",  default: false
    t.text     "approval_message"
  end

  add_index "professor_settings", ["user_id"], name: "index_professor_settings_on_user_id"

  create_table "project_applications", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "message"
    t.text     "title_message"
  end

  add_index "project_applications", ["project_id"], name: "index_project_applications_on_project_id"
  add_index "project_applications", ["user_id"], name: "index_project_applications_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "item_id"
    t.string   "item_title"
    t.integer  "column_type"
    t.datetime "item_date"
    t.text     "item_text"
    t.boolean  "approval_status"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "student_courses", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.boolean  "courseA",         default: false
    t.boolean  "courseB",         default: false
    t.boolean  "courseC",         default: false
    t.boolean  "courseD",         default: false
    t.boolean  "courseE",         default: false
    t.text     "student_message"
  end

  add_index "student_courses", ["user_id"], name: "index_student_courses_on_user_id"

  create_table "student_settings", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.boolean  "allow_viewing", default: false
  end

  add_index "student_settings", ["user_id"], name: "index_student_settings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.boolean  "administrator",          default: false
    t.string   "user_id"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
