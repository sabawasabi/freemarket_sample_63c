class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.integer :house_number, null: false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end
