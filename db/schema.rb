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

ActiveRecord::Schema.define(version: 20130310224604) do

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

  create_table "expenses", force: true do |t|
    t.integer  "sum"
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["result_id"], name: "index_expenses_on_result_id"

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
    t.integer  "seedcapital"
    t.string   "password_digest"
    t.string   "salt"
    t.integer  "game_id"
    t.boolean  "wait_for_other_groups"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["game_id"], name: "index_groups_on_game_id"

  create_table "harvests", force: true do |t|
    t.integer "fieldbean"
    t.integer "barley"
    t.integer "oat"
    t.integer "potatoe"
    t.integer "corn"
    t.integer "rye"
    t.integer "wheat"
    t.integer "beet"
    t.integer  "income_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "harvests", ["income_id"], name: "index_harvests_on_income_id"

  create_table "incomes", force: true do |t|
    t.integer :sum
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["result_id"], name: "index_incomes_on_result_id"

  create_table "investments", force: true do |t|
    t.integer  "expense_id"
    t.integer  "animals"
    t.integer  "machines"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investments", ["expense_id"], name: "index_investments_on_expense_id"

  create_table "parcels", force: true do |t|
    t.integer  "number"
    t.integer  "nutrition"
    t.integer  "soil"
    t.string   "cropsequence"
    t.integer  "harvest_yield"
    t.string   "harvest"
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
    t.integer  "profit"
    t.integer  "capital"
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

  create_table "running_costs", force: true do |t|
    t.integer "organic_control"
    t.integer "fertilize"
    t.integer "pesticide"
    t.integer "organisms"
    t.integer "animals"
    t.integer "base"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "running_costs", ["expense_id"], name: "index_running_costs_on_expense_id"

  create_table "seeds", force: true do |t|
    t.integer "fieldbean"
    t.integer "barley"
    t.integer "oat"
    t.integer "potatoe"
    t.integer "corn"
    t.integer "rye"
    t.integer "wheat"
    t.integer "beet"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seeds", ["expense_id"], name: "index_seeds_on_expense_id"

end
