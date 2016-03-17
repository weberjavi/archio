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

ActiveRecord::Schema.define(version: 20160317170832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "building_sheets", force: :cascade do |t|
    t.text     "description"
    t.string   "substructure"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "project_id"
  end

  add_index "building_sheets", ["project_id"], name: "index_building_sheets_on_project_id", using: :btree

  create_table "context_sheets", force: :cascade do |t|
    t.string   "context_type"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "context_types", force: :cascade do |t|
    t.integer  "contextable_id"
    t.string   "contextable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "context_id"
  end

  add_index "context_types", ["context_id"], name: "index_context_types_on_context_id", using: :btree
  add_index "context_types", ["contextable_type", "contextable_id"], name: "index_context_types_on_contextable_type_and_contextable_id", using: :btree

  create_table "contexts", force: :cascade do |t|
    t.text     "interpretation"
    t.text     "discussion"
    t.string   "site_code"
    t.string   "area"
    t.string   "context"
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

  create_table "masonry_sheets", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  add_index "masonry_sheets", ["project_id"], name: "index_masonry_sheets_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

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
    t.integer  "contextable_id"
    t.string   "contextable_type"
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
    t.integer  "project_id"
  end

  add_index "timber_sheets", ["project_id"], name: "index_timber_sheets_on_project_id", using: :btree

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

  add_foreign_key "building_sheets", "projects"
  add_foreign_key "context_types", "contexts"
  add_foreign_key "contexts", "projects"
  add_foreign_key "masonry_sheets", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "roles", "users"
  add_foreign_key "timber_sheets", "projects"
end
