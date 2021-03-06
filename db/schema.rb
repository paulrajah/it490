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

ActiveRecord::Schema.define(version: 20131008165424) do

  create_table "aircraft_types", force: true do |t|
    t.string   "code",       limit: 3
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aircraft_types", ["code"], name: "index_aircraft_types_on_code", unique: true

  create_table "aircrafts", force: true do |t|
    t.string   "tail_number",      limit: 6
    t.integer  "aircraft_type_id"
    t.integer  "fuel_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aircrafts", ["tail_number"], name: "index_aircrafts_on_tail_number", unique: true

  create_table "aircrews", force: true do |t|
    t.integer  "pilot_id"
    t.integer  "navigator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airports", force: true do |t|
    t.string   "code",       limit: 3
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "airports", ["code"], name: "index_airports_on_code", unique: true

  create_table "cargos", force: true do |t|
    t.integer  "weight"
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.integer  "request_id"
    t.integer  "aircraft_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer  "cargo_id"
    t.integer  "aircrew_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flights", ["number"], name: "index_flights_on_number"

  create_table "navigators", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pilots", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipment_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "desired_departure_datetime"
    t.integer  "cargo_weight"
    t.string   "cargo_contents"
    t.boolean  "is_accepted",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
