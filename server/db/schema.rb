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

ActiveRecord::Schema.define(:version => 11) do

  create_table "cards", :force => true do |t|
    t.integer  "character_id",     :null => false
    t.integer  "master_card_code", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "ap",             :null => false
    t.integer  "max_ap",         :null => false
    t.datetime "ap_recorded_at", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "money",          :null => false
    t.integer  "equip_card_id"
  end

  create_table "jinjas", :force => true do |t|
    t.integer  "money",      :null => false
    t.integer  "grade",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_card_lineups", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "card_code",   :null => false
    t.integer  "probability", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "master_card_lineups", ["name"], :name => "index_master_card_lineups_on_name"
  add_index "master_card_lineups", ["probability"], :name => "index_master_card_lineups_on_probability"

  create_table "master_cards", :force => true do |t|
    t.integer "code",   :null => false
    t.string  "name",   :null => false
    t.integer "rarity"
  end

  create_table "users", :force => true do |t|
    t.string   "uid",         :null => false
    t.string   "provider",    :null => false
    t.string   "provider_id", :null => false
    t.string   "role",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "users", ["uid", "provider"], :name => "index_users_on_uid_and_provider", :unique => true

end
