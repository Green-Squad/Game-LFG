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

ActiveRecord::Schema.define(version: 20150401143203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["activity_id"], name: "index_activities_on_activity_id", using: :btree
  add_index "activities", ["game_id"], name: "index_activities_on_game_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "consoles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_consoles", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "console_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_consoles", ["console_id"], name: "index_game_consoles_on_console_id", using: :btree
  add_index "game_consoles", ["game_id"], name: "index_game_consoles_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["slug"], name: "index_games_on_slug", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "looking_for",              null: false
    t.text     "notes",       default: "", null: false
    t.datetime "expires_at",               null: false
    t.integer  "player_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["activity_id"], name: "index_groups_on_activity_id", using: :btree
  add_index "groups", ["player_id"], name: "index_groups_on_player_id", using: :btree

  create_table "identifiers", force: :cascade do |t|
    t.string   "ip_address",  null: false
    t.string   "fingerprint", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identifiers", ["user_id"], name: "index_identifiers_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "input_type",  default: "text", null: false
    t.string   "placeholder",                  null: false
    t.integer  "min_value"
    t.integer  "max_value"
    t.boolean  "required",    default: false,  null: false
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["game_id"], name: "index_options_on_game_id", using: :btree

  create_table "player_options", force: :cascade do |t|
    t.string   "value"
    t.integer  "option_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_options", ["option_id"], name: "index_player_options_on_option_id", using: :btree
  add_index "player_options", ["player_id"], name: "index_player_options_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "gamertag",                   null: false
    t.boolean  "mic",        default: false, null: false
    t.integer  "region_id"
    t.integer  "console_id"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["console_id"], name: "index_players_on_console_id", using: :btree
  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree
  add_index "players", ["region_id"], name: "index_players_on_region_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "api_token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
