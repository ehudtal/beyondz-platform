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

ActiveRecord::Schema.define(version: 20140813160952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignment_definitions", force: true do |t|
    t.string   "title"
    t.string   "led_by"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "front_page_info"
    t.text     "details_summary"
    t.text     "details_content"
    t.string   "complete_module_url"
    t.string   "assignment_download_url"
    t.datetime "eal_due_date"
    t.text     "final_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "seo_name"
  end

  create_table "assignments", force: true do |t|
    t.integer  "assignment_definition_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.datetime "completed_at"
    t.boolean  "tasks_complete",           default: false
    t.datetime "submitted_at"
  end

  add_index "assignments", ["assignment_definition_id"], name: "index_assignments_on_assignment_definition_id", using: :btree
  add_index "assignments", ["state"], name: "index_assignments_on_state", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "coach_students", force: true do |t|
    t.integer  "coach_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coach_students", ["coach_id"], name: "index_coach_students_on_coach_id", using: :btree
  add_index "coach_students", ["student_id"], name: "index_coach_students_on_student_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "file_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "accepts_txt"
    t.string   "position"
    t.string   "program_col"
    t.boolean  "program_col_col_sjsu"
    t.string   "program_ms"
    t.boolean  "program_ms_ms_epa"
    t.boolean  "program_ms_ms_brk"
    t.boolean  "program_ms_ms_rlm"
    t.boolean  "will_be_student"
    t.string   "university"
    t.string   "anticipated_graduation"
    t.string   "major"
    t.string   "previous_university"
    t.string   "gpa"
    t.string   "online_resume"
    t.string   "resume"
    t.boolean  "bkg_african_americanblack"
    t.boolean  "bkg_asian_american"
    t.boolean  "bkg_latino_or_hispanic"
    t.boolean  "bkg_native_alaskan"
    t.boolean  "bkg_native_american_american_indian"
    t.boolean  "bkg_native_hawaiian"
    t.boolean  "bkg_pacific_islander"
    t.boolean  "bkg_whitecaucasian"
    t.boolean  "bkg_multi_ethnicmulti_racial"
    t.boolean  "identify_poc"
    t.boolean  "identify_low_income"
    t.boolean  "identify_first_gen"
    t.string   "personal_identity"
    t.string   "hometown"
    t.string   "twitter_handle"
    t.string   "personal_website"
    t.string   "reference_name"
    t.string   "reference_how_known"
    t.string   "reference_how_long_known"
    t.string   "reference_email"
    t.string   "reference_phone"
    t.string   "reference2_name"
    t.string   "reference2_how_known"
    t.string   "reference2_how_long_known"
    t.string   "reference2_email"
    t.string   "reference2_phone"
    t.boolean  "affirm_qualified"
    t.boolean  "affirm_commit"
    t.string   "time_taken"
    t.text     "gpa_circumstances"
    t.text     "academic_work_since_undergrad"
    t.text     "community_connection"
    t.text     "last_summer"
    t.text     "post_graduation_plans"
    t.text     "teaching_experience"
    t.text     "personal_passion"
    t.text     "why_bz"
    t.text     "community_organization_commitment"
    t.text     "commitments"
    t.text     "cannot_attend"
    t.text     "comments"
  end

  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "note"
    t.boolean  "optional"
    t.integer  "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_definitions", force: true do |t|
    t.integer  "assignment_definition_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details"
    t.boolean  "required",                 default: false
    t.integer  "position"
    t.text     "summary"
    t.boolean  "requires_approval",        default: false
  end

  add_index "task_definitions", ["assignment_definition_id"], name: "index_task_definitions_on_assignment_definition_id", using: :btree
  add_index "task_definitions", ["position"], name: "index_task_definitions_on_position", using: :btree
  add_index "task_definitions", ["required"], name: "index_task_definitions_on_required", using: :btree

  create_table "task_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.integer  "task_section_id"
    t.integer  "task_response_id"
  end

  add_index "task_files", ["task_response_id"], name: "index_task_files_on_task_response_id", using: :btree
  add_index "task_files", ["task_section_id"], name: "index_task_files_on_task_section_id", using: :btree

  create_table "task_modules", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_responses", force: true do |t|
    t.integer  "task_id"
    t.integer  "task_section_id"
    t.text     "answers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "file_type"
  end

  add_index "task_responses", ["task_id"], name: "index_task_responses_on_task_id", using: :btree
  add_index "task_responses", ["task_section_id"], name: "index_task_responses_on_task_section_id", using: :btree

  create_table "task_sections", force: true do |t|
    t.integer  "task_definition_id"
    t.integer  "task_module_id"
    t.integer  "position",           default: 1, null: false
    t.text     "introduction"
    t.text     "configuration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "file_type"
  end

  add_index "task_sections", ["task_definition_id"], name: "index_task_sections_on_task_definition_id", using: :btree
  add_index "task_sections", ["task_module_id"], name: "index_task_sections_on_task_module_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "assignment_id"
    t.integer  "task_definition_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.datetime "submitted_at"
  end

  add_index "tasks", ["assignment_id"], name: "index_tasks_on_assignment_id", using: :btree
  add_index "tasks", ["state"], name: "index_tasks_on_state", using: :btree
  add_index "tasks", ["task_definition_id"], name: "index_tasks_on_task_definition_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "coach"
    t.string   "documentKey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "reset_token"
    t.datetime "reset_expiration"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_administrator"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.string   "unconfirmed_email"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "applicant_type"
    t.boolean  "keep_updated"
    t.string   "anticipated_graduation"
    t.string   "city"
    t.string   "state"
    t.string   "applicant_details"
    t.string   "university_name"
    t.string   "external_referral_url"
    t.string   "internal_referral_url"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
