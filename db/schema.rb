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

ActiveRecord::Schema.define(version: 20200405133454) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",      null: false
    t.integer  "postal_code",  null: false
    t.string   "prefectures",  null: false
    t.string   "city",         null: false
    t.integer  "house_number", null: false
    t.string   "building"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ancestry",                   comment: "カテゴリーパス"
    t.string   "category_name", null: false, comment: "カテゴリー名"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "category_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "products_size_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["category_id"], name: "index_category_sizes_on_category_id", using: :btree
    t.index ["products_size_id"], name: "index_category_sizes_on_products_size_id", using: :btree
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.text     "image",      limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name",                           null: false
    t.text     "description",      limit: 65535, null: false
    t.integer  "category_id"
    t.integer  "products_size_id"
    t.string   "brand"
    t.string   "condition",                      null: false
    t.string   "shipping_charges",               null: false
    t.string   "shipping_area",                  null: false
    t.string   "days_to_delivery",               null: false
    t.integer  "price",                          null: false
    t.string   "status",                         null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["products_size_id"], name: "index_products_on_products_size_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "products_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_products_sizes_on_ancestry", using: :btree
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_transactions_on_product_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                       null: false, comment: "ニックネーム"
    t.string   "email",                                          null: false, comment: "メールアドレス"
    t.string   "encrypted_password",                default: "", null: false, comment: "パスワード（暗号化）"
    t.string   "last_name",                                      null: false, comment: "姓"
    t.string   "first_name",                                     null: false, comment: "名"
    t.string   "last_name_jp",                                   null: false, comment: "姓カナ"
    t.string   "first_name_jp",                                  null: false, comment: "名カナ"
    t.date     "birth_date",                                     null: false, comment: "生年月日"
    t.string   "phone_number",                                                comment: "電話番号"
    t.text     "profile",             limit: 65535,                           comment: "自己紹介文"
    t.text     "icon",                limit: 65535,                           comment: "アイコン"
    t.datetime "remember_created_at",                                         comment: "ログイン情報の保持用"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "category_sizes", "categories"
  add_foreign_key "category_sizes", "products_sizes"
  add_foreign_key "credits", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "products_sizes"
  add_foreign_key "products", "users"
  add_foreign_key "transactions", "products"
  add_foreign_key "transactions", "users"
end
