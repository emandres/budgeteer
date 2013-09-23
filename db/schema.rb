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

ActiveRecord::Schema.define(version: 20130923204542) do

  create_table "accounts", force: true do |t|
    t.string   "name",       null: false
    t.string   "type",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts_budget_templates", id: false, force: true do |t|
    t.integer "account_id",         null: false
    t.integer "budget_template_id", null: false
  end

  create_table "budget_items", force: true do |t|
    t.string   "name"
    t.decimal  "amount",     precision: 10, scale: 2
    t.integer  "budget_id"
    t.integer  "account_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "budget_items", ["account_id"], name: "index_budget_items_on_account_id"
  add_index "budget_items", ["budget_id"], name: "index_budget_items_on_budget_id"

  create_table "budget_templates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budgets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
