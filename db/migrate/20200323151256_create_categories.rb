class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :ancestry,                   comment: "カテゴリーパス"
      t.string :category_name, null: false, comment: "カテゴリー名"
      t.timestamps
    end

    add_index :categories, :ancestry
  end
end
