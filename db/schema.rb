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

ActiveRecord::Schema.define(version: 20141113211236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: true do |t|
    t.integer  "politician_id"
    t.float    "out_state"
    t.float    "in_state"
    t.float    "pac"
    t.float    "individual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["politician_id"], name: "index_contributions_on_politician_id", using: :btree

  create_table "industries", force: true do |t|
    t.integer  "contribution_id"
    t.string   "name"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "industries", ["contribution_id"], name: "index_industries_on_contribution_id", using: :btree

  create_table "organizations", force: true do |t|
    t.integer  "contribution_id"
    t.string   "name"
    t.float    "total"
    t.float    "employee_total"
    t.float    "direct_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["contribution_id"], name: "index_organizations_on_contribution_id", using: :btree

  create_table "politicians", force: true do |t|
    t.string   "title"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "full_name"
    t.string   "party"
    t.string   "state"
    t.string   "district"
    t.string   "gender"
    t.string   "phone"
    t.string   "website"
    t.string   "webform"
    t.string   "drive_id"
    t.string   "entity_id"
    t.string   "bioguide_id"
    t.string   "votesmart_id"
    t.string   "fec_id"
    t.string   "govtrack_id"
    t.string   "crp_id"
    t.string   "twitter_id"
    t.string   "youtube_url"
    t.string   "congresspedia_url"
    t.date     "birthdate"
    t.string   "oc_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "word_counts", force: true do |t|
    t.integer  "contribution_id"
    t.float    "tfidf"
    t.integer  "count"
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_counts", ["contribution_id"], name: "index_word_counts_on_contribution_id", using: :btree

  create_table "zipcodes", force: true do |t|
    t.integer  "politician_id"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zipcodes", ["politician_id"], name: "index_zipcodes_on_politician_id", using: :btree

end
