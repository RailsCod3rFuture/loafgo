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

ActiveRecord::Schema.define(version: 20180314190925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breads", force: :cascade do |t|
    t.string "bread_name"
    t.string "bread_type"
    t.date "bread_expire_date"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "upc"
    t.string "image_url"
    t.bigint "inventory_id"
    t.index ["inventory_id"], name: "index_breads_on_inventory_id"
    t.index ["warehouse_id"], name: "index_breads_on_warehouse_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "company"
    t.string "zip_code"
    t.string "state"
    t.string "telephone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "deliveries", force: :cascade do |t|
    t.datetime "delivery_date"
    t.boolean "delivery_on_time"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "delivery_order_id"
    t.index ["delivery_order_id"], name: "index_deliveries_on_delivery_order_id"
    t.index ["warehouse_id"], name: "index_deliveries_on_warehouse_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_delivery_orders_on_delivery_id"
    t.index ["order_id"], name: "index_delivery_orders_on_order_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "bread_stock_quantity"
    t.boolean "bread_inventory_low"
    t.bigint "warehouse_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bread_id"
    t.index ["manager_id"], name: "index_inventories_on_manager_id"
    t.index ["warehouse_id"], name: "index_inventories_on_warehouse_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "contact_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "order_feedbacks", force: :cascade do |t|
    t.string "title"
    t.string "order_opinion"
    t.text "feedback_body_text"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_order_feedbacks_on_delivery_id"
  end

  create_table "order_trackers", force: :cascade do |t|
    t.datetime "order_date"
    t.string "order_created_at"
    t.string "time_delivered"
    t.boolean "delivery_on_time"
    t.bigint "order_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_order_trackers_on_delivery_id"
    t.index ["order_id"], name: "index_order_trackers_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "client_name"
    t.string "client_zip_code"
    t.string "client_state"
    t.string "lon"
    t.string "lat"
    t.string "client_address"
    t.string "bread_name"
    t.string "bread_type"
    t.integer "bread_quantity"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bread_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.datetime "loaded_date"
    t.string "delivery_total"
    t.string "lon"
    t.string "lat"
    t.bigint "warehouse_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_street_address"
    t.string "current_city"
    t.string "current_state"
    t.string "current_country"
    t.string "truck_driver_name"
    t.string "current_location_title"
    t.index ["delivery_id"], name: "index_trucks_on_delivery_id"
    t.index ["warehouse_id"], name: "index_trucks_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "address"
    t.string "zip_code"
    t.integer "delivery_men_count"
    t.string "state"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_warehouses_on_manager_id"
  end

  add_foreign_key "breads", "inventories"
  add_foreign_key "breads", "warehouses"
  add_foreign_key "deliveries", "delivery_orders"
  add_foreign_key "deliveries", "warehouses"
  add_foreign_key "delivery_orders", "deliveries"
  add_foreign_key "delivery_orders", "orders"
  add_foreign_key "inventories", "managers"
  add_foreign_key "inventories", "warehouses"
  add_foreign_key "order_feedbacks", "deliveries"
  add_foreign_key "order_trackers", "deliveries"
  add_foreign_key "order_trackers", "orders"
  add_foreign_key "orders", "clients", on_delete: :cascade
  add_foreign_key "trucks", "deliveries"
  add_foreign_key "trucks", "warehouses"
  add_foreign_key "warehouses", "managers"
end
