class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefectures
    validates :city
    validates :house_number
  end
end
