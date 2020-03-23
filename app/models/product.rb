class Product < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :shipping_charges, presence: true
  validates :shipping_area, presence: true
  validates :days_to_delivery, presence: true
  validates :price, presence: true

  # Associations
  # has_many :product_images
  belongs_to :user
  belongs_to :category
  # belongs_to :brand
  # has_many :transactions
  # has_many :likes
  # has_many :comments
end
