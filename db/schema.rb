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

ActiveRecord::Schema.define(version: 20150701142315) do

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uuid",       null: false
    t.integer  "room_id",    null: false
  end

  add_index "microposts", ["room_id"], name: "index_microposts_on_room_id"
  add_index "microposts", ["uuid"], name: "index_microposts_on_uuid"

  create_table "rooms", force: :cascade do |t|
    t.string   "room_name",                null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "donno",      default: 0.0
    t.float    "wow",        default: 0.0
  end

  add_index "rooms", ["room_name"], name: "index_rooms_on_room_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "uuid",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "donno",      default: false
    t.integer  "wow",        default: 0
    t.integer  "room_id"
  end

  add_index "users", ["room_id"], name: "index_users_on_room_id"
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true

end
