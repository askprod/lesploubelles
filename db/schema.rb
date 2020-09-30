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

ActiveRecord::Schema.define(version: 2020_09_30_132527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bin_brocantes", force: :cascade do |t|
    t.string "day_of_week"
    t.integer "weeks_to_skip"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_bin_brocantes_on_sector_id"
  end

  create_table "bin_greens", force: :cascade do |t|
    t.integer "day"
    t.bigint "street_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_id"], name: "index_bin_greens_on_street_id"
  end

  create_table "bin_recycles", force: :cascade do |t|
    t.integer "day"
    t.bigint "street_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_id"], name: "index_bin_recycles_on_street_id"
  end

  create_table "bin_wastes", force: :cascade do |t|
    t.integer "day"
    t.bigint "street_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_id"], name: "index_bin_wastes_on_street_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.integer "number"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_sectors_on_city_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sector_id"], name: "index_streets_on_sector_id"
  end

end
