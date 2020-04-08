class ProductImage < ApplicationRecord
  belongs_to :product, inverse_of: :product_images, optional: true
  # validates :image, presence: true

  mount_uploader :image, ImageUploader
  
end
