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

ActiveRecord::Schema.define(version: 20160204181247) do

  create_table "ideas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ideation_session_id"
    t.text     "text"
    t.string   "color"
    t.integer  "number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "theme_id"
  end

  add_index "ideas", ["ideation_session_id"], name: "index_ideas_on_ideation_session_id"
  add_index "ideas", ["theme_id"], name: "index_ideas_on_theme_id"
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id"

  create_table "ideation_sessions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "nideas"
    t.integer  "user_id"
    t.integer  "anonymity"
    t.boolean  "available"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "available_session"
    t.integer  "number_votes"
  end

  add_index "ideation_sessions", ["user_id"], name: "index_ideation_sessions_on_user_id"

  create_table "nicknames_feeds", force: :cascade do |t|
    t.string   "nick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ideation_session_id"
    t.string   "nickname"
    t.string   "avatar_file_name"
    t.boolean  "active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "email"
  end

  add_index "participants", ["ideation_session_id"], name: "index_participants_on_ideation_session_id"
  add_index "participants", ["user_id"], name: "index_participants_on_user_id"

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "ideation_session_id"
  end

  add_index "themes", ["ideation_session_id"], name: "index_themes_on_ideation_session_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.string   "user_photo_file_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "idea_id"
    t.integer  "participant_id"
    t.integer  "ideation_session_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "votes", ["idea_id"], name: "index_votes_on_idea_id"
  add_index "votes", ["ideation_session_id"], name: "index_votes_on_ideation_session_id"
  add_index "votes", ["participant_id"], name: "index_votes_on_participant_id"

end
