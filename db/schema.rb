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

ActiveRecord::Schema[7.0].define(version: 2023_08_16_123531) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "appointment_type"
    t.date "appointment_date"
    t.time "appointment_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facility_id", null: false
    t.bigint "user_id", null: false
    t.index ["facility_id"], name: "index_appointments_on_facility_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "facility_name"
    t.string "facility_phone_number"
    t.string "facility_location"
    t.string "facility_description"
    t.string "role", default: "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.date "reminder_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "appointment_id", null: false
    t.bigint "user_id", null: false
    t.index ["appointment_id"], name: "index_reminders_on_appointment_id"
    t.index ["user_id"], name: "index_reminders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date "due_date"
    t.string "phone_number"
    t.string "role", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "facilities"
  add_foreign_key "appointments", "users"
  add_foreign_key "reminders", "appointments"
  add_foreign_key "reminders", "users"
end
