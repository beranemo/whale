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

ActiveRecord::Schema.define(version: 20180407153314) do

  create_table "ages", force: :cascade do |t|
    t.string "age_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "system_flag"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "weather"
    t.string "content"
    t.integer "user_id"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulletins", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount_off"
    t.string "discount_method_code"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.string "name_zh_tw"
    t.string "name_en_us"
    t.string "code"
    t.string "system_flag"
  end

  create_table "discount_methods", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.boolean "is_active", default: true
    t.string "note"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "bulletin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount_method_id"
    t.integer "discount_price"
  end

  create_table "guest_types", force: :cascade do |t|
    t.string "guest_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "system_flag"
  end

  create_table "guests", force: :cascade do |t|
    t.string "age_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.integer "info_way_id"
    t.string "gender", default: "", null: false
    t.string "payment"
    t.string "guest_type_id", default: "", null: false
    t.integer "user_id"
    t.string "remark"
  end

  create_table "hair_types", force: :cascade do |t|
    t.string "value"
    t.string "system_flag", default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
  end

  create_table "info_ways", force: :cascade do |t|
    t.string "news_channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "system_flag"
  end

  create_table "member_types", force: :cascade do |t|
    t.string "value"
    t.string "system_flag", default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "birthday", null: false
    t.string "gender", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "avatar"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "fax"
    t.string "password"
    t.string "zip"
    t.string "county"
    t.string "address"
    t.integer "bonus", default: 0
    t.integer "skin_type_id"
    t.integer "hair_type_id"
    t.integer "member_type_id"
    t.integer "info_way_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "member_id"
    t.integer "user_id"
    t.integer "amount"
    t.string "address"
    t.string "payment_method"
    t.string "name"
    t.string "phone"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount_off"
    t.boolean "status"
    t.integer "sn"
    t.integer "guest_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "zh_name"
    t.string "en_name"
    t.string "capacity"
    t.integer "price"
    t.string "upc"
    t.string "use_for"
    t.text "directions"
    t.text "zh_m_ingredients"
    t.text "zh_ingredients"
    t.text "en_ingredients"
    t.integer "quantity", default: 0
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "code"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "label"
  end

  create_table "skin_types", force: :cascade do |t|
    t.string "value"
    t.string "system_flag", default: "N"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
  end

  create_table "stock_records", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "status"
    t.boolean "resigned", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
