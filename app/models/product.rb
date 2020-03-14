class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :shipping_charges, presence: true
  validates :shipping_area, presence: true
  validates :days_to_delivery, presence: true
  validates :price, presence: true

  has_many :product_image
  accepts_nested_attributes_for :product_image
end
