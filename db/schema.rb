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

ActiveRecord::Schema.define(version: 20130303154841) do

  create_table "decisions", force: true do |t|
    t.integer  "machines"
    t.boolean  "organic"
    t.boolean  "pesticide"
    t.boolean  "fertilize"
    t.boolean  "organisms"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decisions", ["round_id"], name: "index_decisions_on_round_id"

  create_table "fields", force: true do |t|
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["round_id"], name: "index_fields_on_round_id"

  create_table "games", force: true do |t|
    t.string   "title"
    t.string   "weather"
    t.string   "vermin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "groupname"
    t.string   "password_digest"
    t.string   "salt"
    t.integer  "game_id"
    t.boolean  "wait_for_other_groups"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["game_id"], name: "index_groups_on_game_id"

  create_table "parcels", force: true do |t|
    t.integer "number"
    t.integer  "nutrition"
    t.integer  "soil"
    t.string   "cropsequence"
    t.string  "harvest"
    t.string   "plantation"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parcels", ["field_id"], name: "index_parcels_on_field_id"

  create_table "results", force: true do |t|
    t.integer  "machines"
    t.boolean  "organic"
    t.string   "weather"
    t.string   "vermin"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["round_id"], name: "index_results_on_round_id"

  create_table "rounds", force: true do |t|
    t.integer  "number"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["group_id"], name: "index_rounds_on_group_id"

end
