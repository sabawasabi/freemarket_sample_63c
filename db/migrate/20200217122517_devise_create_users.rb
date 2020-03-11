# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,           null: false, comment: "ニックネーム"
      t.string :email,              null: false, comment: "メールアドレス"
      t.string :password,           null: false, comment: "パスワード"
      t.string :last_name,          null: false, comment: "ラストネーム"
      t.string :first_name,         null: false, comment: "ファーストネーム"
      t.string :last_name_jp,       null: false, comment: "苗字(姓)"
      t.string :first_name_jp,      null: false, comment: "名前(名)"
      t.integer :birth_year,        null: false, comment: "誕生年"
      t.integer :birth_month,       null: false, comment: "誕生月"
      t.integer :birth_day,         null: false, comment: "誕生日"
      t.integer :phone_number,     unique: true, comment: "電話番号"
      t.text :profile                          , comment: "自己紹介文"
      t.text :icon                             , comment: "アイコン"   
      t.timestamps                  null: false
    end

    add_index :users, :email,       unique: true
  end
end
