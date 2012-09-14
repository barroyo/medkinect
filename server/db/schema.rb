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

ActiveRecord::Schema.define(:version => 20120914024749) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.string   "version_api"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "calendars", :force => true do |t|
    t.integer  "user_id"
    t.integer  "patient_id"
    t.date     "date"
    t.string   "date_type"
    t.text     "result"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "historical_scores", :force => true do |t|
    t.integer  "symbol_id",                                                                           :null => false
    t.decimal  "previous_close",                      :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "bid_real_time",                       :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "open",                                :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "ask_real_time",                       :precision => 10, :scale => 2, :default => 0.0
    t.float    "one_yr_target_price",                                                :default => 0.0
    t.string   "day_range",             :limit => 30
    t.string   "fifty_two_week_range",  :limit => 30
    t.integer  "volume",                                                             :default => 0
    t.integer  "average_daily_volume",                                               :default => 0
    t.string   "market_capitalization", :limit => 15
    t.string   "related_symbols",       :limit => 50
    t.datetime "storage_date"
  end

  create_table "integrations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "provider_uid"
    t.text     "token"
    t.text     "secret"
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
    t.string   "access"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer "symbol_id",                                                                           :null => false
    t.decimal "previous_close",                      :precision => 10, :scale => 2, :default => 0.0
    t.decimal "bid_real_time",                       :precision => 10, :scale => 2, :default => 0.0
    t.decimal "open",                                :precision => 10, :scale => 2, :default => 0.0
    t.decimal "ask_real_time",                       :precision => 10, :scale => 2, :default => 0.0
    t.float   "one_yr_target_price",                                                :default => 0.0
    t.string  "day_range",             :limit => 30
    t.string  "fifty_two_week_range",  :limit => 30
    t.integer "volume",                                                             :default => 0
    t.integer "average_daily_volume",                                               :default => 0
    t.string  "market_capitalization", :limit => 15
    t.string  "related_symbols",       :limit => 50
  end

  add_index "scores", ["symbol_id"], :name => "fk_symbol"

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

  create_table "stock_symbols", :force => true do |t|
    t.string   "symbol",            :limit => 5, :null => false
    t.string   "processing_host",   :limit => 5
    t.datetime "last_process_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_symbols", ["processing_host", "last_process_date"], :name => "symbol_lock"
  add_index "stock_symbols", ["symbol"], :name => "symbol_UNIQUE", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "fullname"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "role_id"
    t.float    "kinect_angle"
  end

end
