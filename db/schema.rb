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

ActiveRecord::Schema[7.1].define(version: 2024_02_16_211015) do
  create_table "driver_vehicles", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_driver_vehicles_on_driver_id"
    t.index ["vehicle_id"], name: "index_driver_vehicles_on_vehicle_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "driver_license_number"
    t.boolean "medical_card"
    t.date "medical_card_expiration"
    t.date "driver_application_doc"
    t.date "drug_test_date"
    t.date "mvr_report_date"
    t.date "clearinghouse_date"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "unit_number"
    t.string "plate_number"
    t.string "vin_number"
    t.date "registration_expiration"
    t.date "insurance_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "driver_vehicles", "drivers"
  add_foreign_key "driver_vehicles", "vehicles"
end
