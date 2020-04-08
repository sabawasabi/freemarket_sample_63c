class Product < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :shipping_charges, presence: true
  validates :shipping_area, presence: true
  validates :days_to_delivery, presence: true
  validates :price, presence: true
  validates :status, presence: true

  # Associations
  belongs_to :user
  belongs_to :category
  belongs_to :products_size
  # has_many :transactions
  # has_many :likes
  # has_many :comments

  has_many :product_images, inverse_of: :product ,dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  # Active_hash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :conditiontag
  belongs_to_active_hash :chargetag
  belongs_to_active_hash :areatag
  belongs_to_active_hash :daystag
end
