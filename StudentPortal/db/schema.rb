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

ActiveRecord::Schema.define(version: 20140421160717) do

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "contact_info"
    t.string   "club_page_link"
    t.string   "sponsor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_imports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "sponsor"
    t.text     "additionalInfo"
    t.boolean  "food",           default: false
    t.boolean  "swag",           default: false
    t.boolean  "comp",           default: false
    t.boolean  "important",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", force: true do |t|
    t.string   "name"
    t.string   "personal_page_link"
    t.string   "email"
    t.string   "office_location"
    t.string   "phone_number"
    t.text     "classes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "kind"
    t.string   "title"
    t.text     "desc"
    t.string   "poster"
    t.string   "host"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "researches", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "userName"
    t.string   "passwordHash"
    t.string   "passwordSalt"
    t.integer  "bitmask"
    t.string   "clubInfo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "student"
    t.boolean  "faculty"
  end

end
