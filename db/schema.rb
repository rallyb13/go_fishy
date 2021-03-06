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

ActiveRecord::Schema.define(version: 20150203180741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "fish"
    t.boolean  "dealt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["dealt"], name: "index_cards_on_dealt", using: :btree
  add_index "cards", ["fish"], name: "index_cards_on_fish", using: :btree

  create_table "cards_players", force: :cascade do |t|
    t.integer "player_id"
    t.integer "card_id"
  end

  add_index "cards_players", ["card_id"], name: "index_cards_players_on_card_id", using: :btree
  add_index "cards_players", ["player_id"], name: "index_cards_players_on_player_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.string   "name"
    t.integer  "player_num"
  end

end
