class Address < ApplicationRecord
  before_validation :shaping_data

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_jp
    validates :first_name_jp
    validates :postal_code
    validates :prefectures
    validates :city
    validates :house_number
  end

  validates :postal_code, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }
  validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ }

  private
   def shaping_data
    self.postal_code = postal_code.delete("-")
    self.phone_number = phone_number.delete("-")
   end
end
