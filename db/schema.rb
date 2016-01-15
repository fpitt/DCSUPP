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

ActiveRecord::Schema.define(version: 20150830174150) do

  create_table "professor_settings", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.boolean  "approval_status",  default: false
    t.text     "approval_message"
  end

  add_index "professor_settings", ["user_id"], name: "index_professor_settings_on_user_id"

  create_table "project_applications", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "message"
    t.string   "title"
    t.string   "resume_url"
    t.boolean  "professor_approved"
    t.boolean  "student_approved"
    t.boolean  "administrator_approved"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "project_applications", ["project_id"], name: "index_project_applications_on_project_id"
  add_index "project_applications", ["user_id"], name: "index_project_applications_on_user_id"

  create_table "project_requirements", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "requirement_subcategory_id"
    t.integer  "project_id"
    t.string   "value"
    t.string   "subcategory_name"
    t.string   "comparison"
  end

  add_index "project_requirements", ["project_id"], name: "index_project_requirements_on_project_id"
  add_index "project_requirements", ["requirement_subcategory_id"], name: "index_project_requirements_on_requirement_subcategory_id"

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "title"
    t.datetime "deadline_date"
    t.text     "text"
    t.boolean  "approval_status"
    t.boolean  "completed"
    t.boolean  "looking_for_students"
    t.text     "additional_requirement"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "professor_id"
    t.boolean  "project_rating"
    t.integer  "project_id"
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "references", force: :cascade do |t|
    t.string   "student_text"
    t.string   "professor_text"
    t.boolean  "professor_approved"
    t.boolean  "student_approved"
    t.integer  "references"
    t.integer  "project_application_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requirement_categories", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category_name"
  end

  create_table "requirement_subcategories", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "sub_category_name"
    t.integer  "requirement_category_id"
    t.string   "attribute_type"
    t.string   "upper_limit"
    t.string   "lower_limit"
    t.string   "regex"
    t.string   "placeholder"
    t.boolean  "student_attribute"
  end

  add_index "requirement_subcategories", ["requirement_category_id"], name: "index_requirement_subcategories_on_requirement_category_id"

  create_table "student_attributes", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "requirement_subcategory_id"
    t.integer  "user_id"
    t.string   "value"
    t.integer  "requirement_category_id"
  end

  add_index "student_attributes", ["requirement_subcategory_id"], name: "index_student_attributes_on_requirement_subcategory_id"
  add_index "student_attributes", ["user_id"], name: "index_student_attributes_on_user_id"

  create_table "student_settings", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.boolean  "apply_project", default: true
    t.boolean  "allow_viewing", default: false
  end

  add_index "student_settings", ["user_id"], name: "index_student_settings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.string   "fullname"
    t.boolean  "professor",     default: false
    t.boolean  "administrator", default: false
    t.text     "introduction"
    t.string   "contact_email"
    t.string   "fullname4"
  end

end
