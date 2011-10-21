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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111006065259) do

  create_table "coordinator_regulars", :force => true do |t|
    t.string   "name",           :limit => 75,                               :null => false
    t.decimal  "player_index",                 :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coordinator_id",                                             :null => false
  end

  add_index "coordinator_regulars", ["coordinator_id"], :name => "fk_coordinator_regulars_coordinators"

  create_table "coordinators", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",                         :default => "", :null => false
    t.string   "hashed_password", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",            :limit => 40
  end

  create_table "game_players", :force => true do |t|
    t.string   "name",         :limit => 75,                               :null => false
    t.decimal  "player_index",               :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id",                                                  :null => false
  end

  add_index "game_players", ["game_id"], :name => "fk_game_players_games"

  create_table "games", :force => true do |t|
    t.string   "game_name",        :limit => 50, :null => false
    t.integer  "coordinator_id",                 :null => false
    t.integer  "gametype_id"
    t.boolean  "is_handicapped",                 :null => false
    t.integer  "number_of_rounds"
    t.string   "join_code",        :limit => 40, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gamestate_id"
  end

  add_index "games", ["coordinator_id"], :name => "fk_games_coordinators"
  add_index "games", ["gamestate_id"], :name => "fk_game_gamestates"
  add_index "games", ["gametype_id"], :name => "fk_games_gametypes"

  create_table "gamestates", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gametypes", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
