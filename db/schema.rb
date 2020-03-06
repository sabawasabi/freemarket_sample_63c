ActiveRecord::Schema.define(version: 2020_02_17_122517) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false, comment: "ニックネーム"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "encrypted_password", null: false, comment: "パスワード(暗号化)"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_jp", null: false
    t.string "first_name_jp", null: false
    t.integer "birth_year", null: false
    t.integer "birth_month", null: false
    t.integer "birth_day", null: false
    t.integer "phone_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                           null: false
    t.text     "description",      limit: 65535, null: false
    t.string   "condition",                      null: false
    t.string   "shipping_charges",               null: false
    t.string   "shipping_area",                  null: false
    t.string   "days_to_delivery",               null: false
    t.integer  "price",                          null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
