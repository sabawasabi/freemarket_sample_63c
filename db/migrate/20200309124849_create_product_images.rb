class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      # t.references :product_id, foreign_key: true
      t.text :image, null: false
      t.timestamps
    end
  end
end
