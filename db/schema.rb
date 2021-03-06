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

ActiveRecord::Schema.define(version: 20160403221940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "building_sheets", force: :cascade do |t|
    t.text     "description"
    t.string   "substructure"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "context_sheets", force: :cascade do |t|
    t.string   "context_type"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contexts", force: :cascade do |t|
    t.text     "interpretation"
    t.text     "discussion"
    t.string   "site_code"
    t.string   "area"
    t.string   "ue"
    t.datetime "date"
    t.string   "recorded_by"
    t.string   "below"
    t.string   "above"
    t.string   "section"
    t.string   "trench"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "contextable_id"
    t.string   "contextable_type"
    t.integer  "project_id"
  end

  add_index "contexts", ["project_id"], name: "index_contexts_on_project_id", using: :btree

  create_table "contexts_plans", id: false, force: :cascade do |t|
    t.integer "context_id", null: false
    t.integer "plan_id",    null: false
  end

  add_index "contexts_plans", ["context_id", "plan_id"], name: "index_contexts_plans_on_context_id_and_plan_id", using: :btree
  add_index "contexts_plans", ["plan_id", "context_id"], name: "index_contexts_plans_on_plan_id_and_context_id", using: :btree

  create_table "contexts_section_drawings", id: false, force: :cascade do |t|
    t.integer "context_id"
    t.integer "section_drawing_id"
  end

  add_index "contexts_section_drawings", ["context_id"], name: "index_contexts_section_drawings_on_context_id", using: :btree
  add_index "contexts_section_drawings", ["section_drawing_id"], name: "index_contexts_section_drawings_on_section_drawing_id", using: :btree

  create_table "find_bags", force: :cascade do |t|
    t.string   "token"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "context_id"
  end

  add_index "find_bags", ["context_id"], name: "index_find_bags_on_context_id", using: :btree

  create_table "find_drawings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finds", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "find_bag_id"
  end

  add_index "finds", ["find_bag_id"], name: "index_finds_on_find_bag_id", using: :btree

  create_table "masonry_sheets", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "lat"
    t.string   "lng"
    t.integer  "later_chronology"
    t.integer  "earlier_chronology"
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree
  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "samples", force: :cascade do |t|
    t.string   "token"
    t.integer  "context_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_drawings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skeleton_sheets", force: :cascade do |t|
    t.string   "grave_type"
    t.string   "grave_cut"
    t.string   "grave_fill"
    t.string   "coffin"
    t.string   "orientation"
    t.string   "group"
    t.string   "burial_number"
    t.string   "provisional_period"
    t.text     "skeleton_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "timber_sheets", force: :cascade do |t|
    t.text     "description"
    t.string   "species"
    t.boolean  "dendro_sample"
    t.boolean  "knotty"
    t.boolean  "bark"
    t.boolean  "sapwood"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "contexts", "projects"
  add_foreign_key "find_bags", "contexts"
  add_foreign_key "finds", "find_bags"
  add_foreign_key "roles", "users"
end
