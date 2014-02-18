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

ActiveRecord::Schema.define(version: 20140218042455) do

  create_table "friendships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "requester_id"
    t.integer  "receiver_id"
  end

  add_index "friendships", ["receiver_id"], name: "index_friendships_on_receiver_id"
  add_index "friendships", ["requester_id"], name: "index_friendships_on_requester_id"

  create_table "runs", force: true do |t|
    t.string   "name"
    t.integer  "distance"
    t.integer  "run_time"
    t.string   "workout_datetime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mmf_identifier"
  end

  add_index "runs", ["user_id"], name: "index_runs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "photo_url"
  end

end
