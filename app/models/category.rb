class Category < ApplicationRecord
  has_ancestry
  
  # Validations
  validates :category_name, presence: true

  # Associations
  has_many :products

end
