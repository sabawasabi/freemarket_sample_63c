class Category < ApplicationRecord

  # Validations
  validates :category_name, presence: true

  # Associations
  has_many :products
  has_ancestry
end