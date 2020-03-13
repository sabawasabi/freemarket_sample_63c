class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :last_name
    validates :first_name
    validates :last_name_jp
    validates :first_name_jp
    validates :birth_date
  end

  # validates :email, format: { with: /\A[a-zA-Z]+\z/}, uniqueness: true
  # validates :password, length: { minimum: 7 }, confirmation: true
  validates :phone_number, uniqueness: true, allow_nil: true

  # アソシエーション
  # has_many :credit_cards
  # has_many :transactions
  # has_one :address
  # has_many :likes
  # has_many :comments
  has_many :products
end
