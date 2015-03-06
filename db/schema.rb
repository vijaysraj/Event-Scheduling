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

ActiveRecord::Schema.define(version: 20150305072906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "venue"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "invitee_id"
    t.integer  "user_id"
  end

  add_index "events", ["invitee_id"], name: "index_events_on_invitee_id", using: :btree

  create_table "invitees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "response"
  end

  add_index "invitees", ["event_id"], name: "index_invitees_on_event_id", using: :btree
  add_index "invitees", ["user_id"], name: "index_invitees_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.integer  "invitee_id"
  end

  add_index "users", ["invitee_id"], name: "index_users_on_invitee_id", using: :btree

  add_foreign_key "events", "invitees"
  add_foreign_key "invitees", "events"
  add_foreign_key "invitees", "users"
  add_foreign_key "users", "invitees"
end
