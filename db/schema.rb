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

ActiveRecord::Schema.define(version: 20150401143213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
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

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "activity_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["activity_id"], name: "index_activities_on_activity_id", using: :btree
  add_index "activities", ["group_id"], name: "index_activities_on_group_id", using: :btree

  create_table "admin_users", force: true do |t|
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

  create_table "consoles", force: true do |t|
    t.integer  "game_console_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consoles", ["game_console_id"], name: "index_consoles_on_game_console_id", using: :btree
  add_index "consoles", ["player_id"], name: "index_consoles_on_player_id", using: :btree

  create_table "game_consoles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "game_console_id"
    t.integer  "option_id"
    t.integer  "player_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["activity_id"], name: "index_games_on_activity_id", using: :btree
  add_index "games", ["game_console_id"], name: "index_games_on_game_console_id", using: :btree
  add_index "games", ["option_id"], name: "index_games_on_option_id", using: :btree
  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "looking_for"
    t.text     "notes"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identifiers", force: true do |t|
    t.string   "ip_address"
    t.string   "fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: true do |t|
    t.string   "name"
    t.string   "input_type"
    t.string   "placeholder"
    t.integer  "min_value"
    t.integer  "max_value"
    t.boolean  "required"
    t.integer  "player_options_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "options", ["player_options_id"], name: "index_options_on_player_options_id", using: :btree

  create_table "player_options", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "gamertag"
    t.boolean  "mic"
    t.integer  "group_id"
    t.integer  "player_options_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["group_id"], name: "index_players_on_group_id", using: :btree
  add_index "players", ["player_options_id"], name: "index_players_on_player_options_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["player_id"], name: "index_regions_on_player_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "api_token"
    t.integer  "identifier_id"
    t.integer  "player_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["identifier_id"], name: "index_users_on_identifier_id", using: :btree
  add_index "users", ["player_id"], name: "index_users_on_player_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
