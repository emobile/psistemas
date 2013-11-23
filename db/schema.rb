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

ActiveRecord::Schema.define(version: 20131122053233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: true do |t|
    t.string   "name",                         null: false
    t.string   "contact_name",                 null: false
    t.string   "email1",                       null: false
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1",                       null: false
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1",                     null: false
    t.string   "address2",                     null: false
    t.string   "city",                         null: false
    t.string   "state",                        null: false
    t.integer  "zip",                          null: false
    t.string   "country",                      null: false
    t.boolean  "main_branch",  default: false, null: false
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree

  create_table "cellphones", force: true do |t|
    t.string   "phone_number"
    t.string   "model"
    t.string   "brand"
    t.string   "color"
    t.string   "ope_system"
    t.text     "condition"
    t.string   "imei"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cellphones", ["branch_id"], name: "index_cellphones_on_branch_id", using: :btree
  add_index "cellphones", ["company_id"], name: "index_cellphones_on_company_id", using: :btree
  add_index "cellphones", ["user_id"], name: "index_cellphones_on_user_id", using: :btree

  create_table "client_branches", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "branch_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_branches", ["branch_id"], name: "index_client_branches_on_branch_id", using: :btree
  add_index "client_branches", ["client_id"], name: "index_client_branches_on_client_id", using: :btree
  add_index "client_branches", ["company_id"], name: "index_client_branches_on_company_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email1"
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "branch_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["branch_id"], name: "index_clients_on_branch_id", using: :btree
  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "email",      null: false
    t.text     "comment",    null: false
    t.string   "app_name",   null: false
    t.integer  "company_id", null: false
    t.integer  "branch_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["branch_id"], name: "index_comments_on_branch_id", using: :btree
  add_index "comments", ["company_id"], name: "index_comments_on_company_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",              null: false
    t.string   "contact_name",      null: false
    t.string   "email1",            null: false
    t.string   "email2"
    t.string   "webpage"
    t.string   "phone1",            null: false
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1",          null: false
    t.string   "address2",          null: false
    t.string   "city",              null: false
    t.string   "state",             null: false
    t.integer  "zip",               null: false
    t.string   "country",           null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "drivers", force: true do |t|
    t.integer  "user_id"
    t.integer  "truck_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drivers", ["branch_id"], name: "index_drivers_on_branch_id", using: :btree
  add_index "drivers", ["company_id"], name: "index_drivers_on_company_id", using: :btree
  add_index "drivers", ["truck_id"], name: "index_drivers_on_truck_id", using: :btree
  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id", using: :btree

  create_table "error_reports", force: true do |t|
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "line_number"
    t.string   "referrer_url"
    t.string   "original_path"
    t.string   "environment"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.text     "description"
    t.text     "backtrace"
    t.datetime "error_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "error_reports", ["branch_id"], name: "index_error_reports_on_branch_id", using: :btree
  add_index "error_reports", ["company_id"], name: "index_error_reports_on_company_id", using: :btree
  add_index "error_reports", ["user_id"], name: "index_error_reports_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["branch_id"], name: "index_messages_on_branch_id", using: :btree
  add_index "messages", ["company_id"], name: "index_messages_on_company_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",                          null: false
    t.boolean  "protected",     default: false, null: false
    t.boolean  "super_admin",   default: false, null: false
    t.boolean  "company_admin", default: false, null: false
    t.boolean  "branch_admin",  default: false, null: false
    t.boolean  "super_manager", default: false, null: false
    t.boolean  "manager",       default: false, null: false
    t.boolean  "routes_admin",  default: false, null: false
    t.boolean  "seller",        default: false, null: false
    t.boolean  "secretary",     default: false, null: false
    t.boolean  "driver",        default: false, null: false
    t.boolean  "client",        default: false, null: false
    t.boolean  "guess",         default: false, null: false
    t.boolean  "other",         default: false, null: false
    t.text     "description",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "hierarchy"
    t.string   "model_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "driver_id"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.boolean  "completed"
    t.string   "priority"
    t.date     "scheduled_date"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.text     "comments"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["branch_id"], name: "index_tasks_on_branch_id", using: :btree
  add_index "tasks", ["company_id"], name: "index_tasks_on_company_id", using: :btree
  add_index "tasks", ["driver_id"], name: "index_tasks_on_driver_id", using: :btree

  create_table "trucks", force: true do |t|
    t.string   "model"
    t.string   "brand"
    t.integer  "year"
    t.string   "truck_type"
    t.string   "plate_no"
    t.string   "serial_no"
    t.string   "color"
    t.integer  "wheels_no"
    t.string   "other"
    t.string   "identifier"
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trucks", ["branch_id"], name: "index_trucks_on_branch_id", using: :btree
  add_index "trucks", ["company_id"], name: "index_trucks_on_company_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",                            null: false
    t.string   "last_name",                             null: false
    t.string   "phone1",                                null: false
    t.string   "phone2"
    t.string   "fax"
    t.string   "address1",                              null: false
    t.string   "address2"
    t.string   "city",                                  null: false
    t.string   "state",                                 null: false
    t.integer  "zip",                                   null: false
    t.string   "country",                               null: false
    t.integer  "company_id",                            null: false
    t.integer  "branch_id",                             null: false
    t.integer  "role_id",                               null: false
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "username",               default: "",   null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["branch_id"], name: "index_users_on_branch_id", using: :btree
  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
