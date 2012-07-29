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

ActiveRecord::Schema.define(:version => 20120702233855) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.string   "version_api"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "dni"
    t.date     "birthdate"
    t.integer  "blood_id"
    t.string   "historical_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "sex"
    t.string   "marital_status"
    t.text     "address"
    t.text     "mobile"
    t.text     "phone"
    t.text     "weight"
    t.text     "height"
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "e"
    t.string   "access"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "sicks", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sickships", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "sick_id"
    t.datetime "diagnostic_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "specialisms", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "specialismships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "specialism_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "fullname"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "role_id"
  end

end
