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

ActiveRecord::Schema.define(:version => 20121011233542) do

  create_table "followers", :force => true do |t|
    t.integer "twitter_id",   :limit => 8
    t.integer "tweepster_id", :limit => 8
  end

  add_index "followers", ["tweepster_id"], :name => "index_followers_on_tweepster_id"
  add_index "followers", ["twitter_id", "tweepster_id"], :name => "index_followers_on_twitter_id_and_tweepster_id", :unique => true

  create_table "tweepsters", :force => true do |t|
    t.string   "username"
    t.integer  "twitter_id", :limit => 8
    t.integer  "cursor",     :limit => 8, :default => -1, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "voting_advices", :force => true do |t|
    t.string   "to"
    t.text     "content"
    t.datetime "sent_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "twitter_id"
  end

end
