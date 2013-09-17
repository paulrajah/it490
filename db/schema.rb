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

ActiveRecord::Schema.define(version: 20130916221544) do

  create_table "aircraft_types", force: true do |t|
    t.string   "code",       limit: 4
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
    t.integer  "number"
    t.string   "origin",         limit: 3
    t.string   "destination",    limit: 3
    t.date     "departure_time"
    t.date     "arrival_time"
    t.integer  "cargo_id"
    t.integer  "crew_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

end
