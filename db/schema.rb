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

ActiveRecord::Schema.define(version: 20141115055643) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "dinner_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["dinner_id"], name: "index_comments_on_dinner_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "dinners", force: true do |t|
    t.datetime "date"
    t.string   "location"
    t.string   "title"
    t.text     "description",        limit: 255
    t.string   "category"
    t.float    "price",                          default: 0.0
    t.integer  "seats_available",                default: 0
    t.datetime "stamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.integer  "seats",                          default: 0
    t.integer  "host_id"
    t.integer  "lock_version"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "currency",                       default: "$"
  end

  add_index "dinners", ["host_id"], name: "index_dinners_on_host_id"

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "dinner_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version"
    t.integer  "yday"
  end

  add_index "reservations", ["dinner_id"], name: "index_reservations_on_dinner_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "n_joined",               default: 0
    t.integer  "n_hosted",               default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
