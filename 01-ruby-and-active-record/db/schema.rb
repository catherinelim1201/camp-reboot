# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_25_030242) do
  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "damage"
    t.integer "defence"
    t.integer "speed"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.index ["player_id"], name: "index_pokemons_on_player_id"
  end

  add_foreign_key "players", "games"
  add_foreign_key "pokemons", "players"
end
