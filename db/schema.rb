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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140410175429) do

  create_table "attendances", :force => true do |t|
    t.integer  "event_id"
    t.integer  "child_id"
    t.string   "klass_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "children", :force => true do |t|
    t.integer  "family_id"
    t.integer  "klass_id"
    t.string   "firstname"
    t.string   "lastname"
    t.text     "allergies"
    t.text     "concerns"
    t.date     "birthday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emails", :force => true do |t|
    t.integer  "event_id"
    t.text     "content"
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "start_time"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "families", :force => true do |t|
    t.string   "familyname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "email"
    t.string   "alt_email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.integer  "min_group_id"
    t.integer  "max_group_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "parents", :force => true do |t|
    t.integer  "family_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "relationship"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "usertype"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
