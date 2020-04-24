# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname,              null: false, comment: "ニックネーム"
      t.string :email,   unique: true, null: false, comment: "メールアドレス"
      t.string :encrypted_password,    null: false, comment: "パスワード（暗号化）", default: ""
      t.string :last_name,             null: false, comment: "姓"
      t.string :first_name,            null: false, comment: "名"
      t.string :last_name_jp,          null: false, comment: "姓カナ"
      t.string :first_name_jp,         null: false, comment: "名カナ"
      t.date   :birth_date,            null: false, comment: "生年月日"
      t.string :phone_number,         unique: true, comment: "電話番号"
      t.text :profile,                              comment: "自己紹介文"
      t.text :icon,                                 comment: "アイコン"
      t.string  :postal_code,                       comment: "郵便番号"
      t.string  :prefectures,                       comment: "都道府県"
      t.string  :city,                              comment: "市町村"
      t.string  :house_number,                      comment: "番地"
      t.string  :building,                          comment: "建物名"
      t.datetime :remember_created_at,              comment: "ログイン情報の保持用"
      t.timestamps                     null: false
    end

    add_index :users, :email,         unique: true
  end
end