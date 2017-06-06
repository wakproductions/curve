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

ActiveRecord::Schema.define(version: 20170530022042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickers", id: :serial, force: :cascade do |t|
    t.string "symbol", limit: 255
    t.string "company_name", limit: 255
    t.string "exchange", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "scrape_data"
    t.string "sector", limit: 255
    t.string "industry", limit: 255
    t.decimal "market_cap"
    t.boolean "djia"
    t.boolean "sp500"
    t.boolean "track_gap_up"
    t.boolean "pullback_alerts"
    t.string "gap_up_note", limit: 255
    t.boolean "adr"
    t.boolean "russell3000"
    t.datetime "date_removed"
    t.string "note", limit: 255
    t.decimal "float", precision: 15, scale: 2
    t.decimal "institutional_holdings_percent"
    t.date "hide_from_reports_until"
    t.integer "category_tag"
    t.date "short_interest_date"
    t.decimal "short_ratio", precision: 15, scale: 3
    t.decimal "short_pct_float", precision: 15, scale: 3
    t.index ["symbol"], name: "index_tickers_on_symbol"
  end

  create_table "yield_curve_snapshots", force: :cascade do |t|
    t.integer "treasury_datum_id"
    t.date "yield_curve_date"
    t.float "yield_1m"
    t.float "yield_3m"
    t.float "yield_6m"
    t.float "yield_1y"
    t.float "yield_2y"
    t.float "yield_3y"
    t.float "yield_5y"
    t.float "yield_7y"
    t.float "yield_10y"
    t.float "yield_20y"
    t.float "yield_30y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["yield_curve_date"], name: "yield_curve_snapshots_unique", unique: true
  end

end
