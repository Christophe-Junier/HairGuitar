# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_21_104838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pro_id", null: false
    t.index ["pro_id"], name: "index_appointments_on_pro_id"
  end

  create_table "booked_prestations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "prestation_id", null: false
    t.bigint "booking_id", null: false
    t.index ["booking_id"], name: "index_booked_prestations_on_booking_id"
    t.index ["prestation_id"], name: "index_booked_prestations_on_prestation_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "address"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "starts_at"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.time "starts_at"
    t.time "ends_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pro_id", null: false
    t.index ["pro_id"], name: "index_opening_hours_on_pro_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "reference"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pros", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.integer "max_kilometers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pros_prestations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pro_id", null: false
    t.bigint "prestation_id", null: false
    t.index ["prestation_id"], name: "index_pros_prestations_on_prestation_id"
    t.index ["pro_id"], name: "index_pros_prestations_on_pro_id"
  end

  add_foreign_key "appointments", "pros"
  add_foreign_key "booked_prestations", "bookings"
  add_foreign_key "booked_prestations", "prestations"
  add_foreign_key "opening_hours", "pros"
  add_foreign_key "pros_prestations", "prestations"
  add_foreign_key "pros_prestations", "pros"
end
