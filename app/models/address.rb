class Address < ApplicationRecord
  before_validation :shaping_data

  # Validations
  with_options presence: true do
    validates :postal_code
    validates :prefectures
    validates :city
    validates :house_number
  end

  validates :postal_code, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }

  # Association
  belongs_to :user

  private
   def shaping_data
      self.postal_code = postal_code.delete("-")
   end
end
