class Category < ApplicationRecord
  has_ancestry

  # Validations
  validates :category_name, presence: true

  # Associations
  has_many :products
  has_many :category_sizes
  has_many :products_sizes, through: :category_sizes
end
