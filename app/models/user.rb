class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  # TODO ユーザー名を全角で入力させるためのバリデーション追加
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  PASSWORD_REGEXP = /\A[a-zA-Z0-9]+\z/
  with_options presence: true do
    validates :nickname
    validates :email
    validates :last_name
    validates :first_name
    validates :last_name_jp
    validates :first_name_jp
    validates :birth_date
  end
  validates :email, format: { with: EMAIL_REGEXP }, uniqueness: true
  validates :password, format: { with: PASSWORD_REGEXP }, length: { minimum: 7 }
  validates :phone_number, uniqueness: true, allow_nil: true

  # Associations
  # has_many :credit_cards
  # has_many :transactions
  # has_one :address
  # has_many :likes
  # has_many :comments
  has_many :products
end
