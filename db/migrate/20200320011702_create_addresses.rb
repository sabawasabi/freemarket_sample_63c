class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user,               null: false, foreign_key: true
      t.string :last_name,              null: false, comment: "姓"
      t.string :first_name,             null: false, comment: "名"
      t.string :last_name_jp,           null: false, comment: "姓カナ"
      t.string :first_name_jp,          null: false, comment: "名カナ"
      t.string  :postal_code,           null: false
      t.string  :prefectures,           null: false
      t.string  :city,                  null: false
      t.string  :house_number,          null: false
      t.string  :building
      t.string :phone_number,           unique: true, comment: "電話番号"
      t.timestamps
    end
  end
end
