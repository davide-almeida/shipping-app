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

ActiveRecord::Schema[7.0].define(version: 2022_05_28_143259) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carriers", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "code_model"
    t.integer "manufact_year"
    t.integer "weight"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_carriers_on_shipping_company_id"
  end

  create_table "delivery_times", force: :cascade do |t|
    t.float "range_start"
    t.float "range_end"
    t.integer "working_day"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_delivery_times_on_shipping_company_id"
  end

  create_table "order_routes", force: :cascade do |t|
    t.integer "status"
    t.string "current_location"
    t.datetime "current_time"
    t.integer "order_service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_service_id"], name: "index_order_routes_on_order_service_id"
  end

  create_table "order_services", force: :cascade do |t|
    t.integer "status"
    t.string "code"
    t.string "full_address"
    t.float "width"
    t.float "height"
    t.float "depth"
    t.float "weight"
    t.float "range"
    t.integer "total_value_cents"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_order_services_on_carrier_id"
    t.index ["shipping_company_id"], name: "index_order_services_on_shipping_company_id"
  end

  create_table "price_settings", force: :cascade do |t|
    t.integer "value_min_cents"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_price_settings_on_shipping_company_id"
  end

  create_table "prices", force: :cascade do |t|
    t.float "cubic_start"
    t.float "cubic_end"
    t.integer "weight_start"
    t.integer "weight_end"
    t.integer "value_kilometer_cents"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_prices_on_shipping_company_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_address"
    t.string "registration_code"
    t.integer "order_service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_service_id"], name: "index_receivers_on_order_service_id"
  end

  create_table "search_price_logs", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "domain"
    t.string "registration_number"
    t.float "cubic_meter"
    t.integer "value_kilometer_cents"
    t.integer "value_min_cents"
    t.integer "deadline"
    t.integer "total_value_cents"
    t.float "range"
    t.datetime "search_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_companies", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "domain"
    t.string "registration_number"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_company_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shipping_company_id"], name: "index_users_on_shipping_company_id"
  end

  add_foreign_key "carriers", "shipping_companies"
  add_foreign_key "delivery_times", "shipping_companies"
  add_foreign_key "order_routes", "order_services"
  add_foreign_key "order_services", "carriers"
  add_foreign_key "order_services", "shipping_companies"
  add_foreign_key "price_settings", "shipping_companies"
  add_foreign_key "prices", "shipping_companies"
  add_foreign_key "receivers", "order_services"
  add_foreign_key "users", "shipping_companies"
end
