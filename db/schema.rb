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

ActiveRecord::Schema.define(:version => 20140430185300) do

  create_table "attendances", :force => true do |t|
    t.integer  "event_id"
    t.integer  "child_id"
    t.string   "klass_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attendances", ["child_id", "event_id"], :name => "index_attendances_on_child_id_and_event_id"
  add_index "attendances", ["child_id"], :name => "index_attendances_on_child_id"
  add_index "attendances", ["event_id"], :name => "index_attendances_on_event_id"

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

  add_index "children", ["family_id"], :name => "index_children_on_family_id"
  add_index "children", ["klass_id"], :name => "index_children_on_klass_id"

  create_table "emails", :force => true do |t|
    t.integer  "event_id"
    t.text     "content"
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["event_id"], :name => "index_emails_on_event_id"

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

  add_index "families", ["alt_phone"], :name => "index_families_on_alt_phone", :unique => true
  add_index "families", ["phone"], :name => "index_families_on_phone", :unique => true

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.integer  "min_group_id"
    t.integer  "max_group_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "klasses", ["name"], :name => "index_klasses_on_name", :unique => true

  create_table "parents", :force => true do |t|
    t.integer  "family_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "relationship"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "parents", ["family_id"], :name => "index_parents_on_family_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "usertype"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
