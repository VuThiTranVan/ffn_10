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

ActiveRecord::Schema.define(version: 2018_08_27_143010) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id"
    t.bigint "football_new_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_new_id"], name: "index_comments_on_football_new_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.float "amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "football_news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "continents"
    t.integer "number_of_match"
    t.integer "number_of_team"
    t.integer "match_time"
    t.integer "number_of_round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "score_win"
    t.integer "score_lost"
    t.bigint "match_id"
    t.integer "win_team_id"
    t.integer "lost_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lost_team_id"], name: "index_match_results_on_lost_team_id", unique: true
    t.index ["match_id"], name: "index_match_results_on_match_id"
    t.index ["win_team_id"], name: "index_match_results_on_win_team_id", unique: true
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date_of_match"
    t.integer "extra_time1"
    t.integer "extra_time2"
    t.integer "time"
    t.integer "team_id1"
    t.integer "team_id2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id1", "team_id2"], name: "index_matches_on_team_id1_and_team_id2", unique: true
    t.index ["team_id1"], name: "index_matches_on_team_id1"
    t.index ["team_id2"], name: "index_matches_on_team_id2"
  end

  create_table "notifies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id"
    t.bigint "score_bet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["score_bet_id"], name: "index_notifies_on_score_bet_id"
    t.index ["user_id"], name: "index_notifies_on_user_id"
  end

  create_table "player_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.string "gender"
    t.integer "weight"
    t.integer "height"
    t.string "position"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_player_infos_on_team_id"
  end

  create_table "rankings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "rank"
    t.bigint "league_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_rankings_on_league_id"
    t.index ["team_id"], name: "index_rankings_on_team_id"
  end

  create_table "rounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_rounds_on_league_id"
    t.index ["match_id"], name: "index_rounds_on_match_id"
  end

  create_table "score_bets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "price"
    t.string "status"
    t.bigint "score_sugest_id"
    t.bigint "match_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_score_bets_on_match_id"
    t.index ["score_sugest_id"], name: "index_score_bets_on_score_sugest_id"
    t.index ["user_id"], name: "index_score_bets_on_user_id"
  end

  create_table "score_sugests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "score_win"
    t.integer "score_lost"
    t.integer "ratio"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_score_sugests_on_match_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "address"
    t.datetime "establish_year"
    t.string "continents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "fullname"
    t.string "gender"
    t.string "password_digest"
    t.string "activation_digest"
    t.string "remember_me_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "admin", default: false
    t.float "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "football_news", column: "football_new_id"
  add_foreign_key "comments", "users"
  add_foreign_key "credits", "users"
  add_foreign_key "match_results", "matches"
  add_foreign_key "notifies", "score_bets"
  add_foreign_key "notifies", "users"
  add_foreign_key "player_infos", "teams"
  add_foreign_key "rankings", "leagues"
  add_foreign_key "rankings", "teams"
  add_foreign_key "rounds", "leagues"
  add_foreign_key "rounds", "matches"
  add_foreign_key "score_bets", "matches"
  add_foreign_key "score_bets", "score_sugests"
  add_foreign_key "score_bets", "users"
  add_foreign_key "score_sugests", "matches"
end
