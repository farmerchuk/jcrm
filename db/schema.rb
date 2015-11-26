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

ActiveRecord::Schema.define(version: 20151126044128) do

  create_table "account_contacts", force: true do |t|
    t.integer  "account_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "industry_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "search_display_name"
    t.string   "search_key"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "search_display_name"
    t.string   "search_key"
  end

  create_table "industries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "noteable_type"
    t.integer  "noteable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "search_display_name"
    t.string   "search_key"
  end

  create_table "opportunities", force: true do |t|
    t.string   "name"
    t.integer  "stage_id"
    t.integer  "account_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "search_display_name"
    t.string   "search_key"
  end

  create_table "opportunity_contacts", force: true do |t|
    t.integer  "opportunity_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunity_stages", force: true do |t|
    t.string   "stage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "opportunity_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone"
    t.boolean  "two_factor"
    t.string   "two_factor_pin"
    t.string   "phone_number"
    t.string   "role_id"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
