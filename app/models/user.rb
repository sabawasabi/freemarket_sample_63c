class User < ApplicationRecord
  before_validation :shaping_data

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :credits

  # Validations
  with_options presence: true do
    validates :nickname
    validates :email
    validates :last_name
    validates :first_name
    validates :last_name_jp
    validates :first_name_jp
    validates :birth_date
  end

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  PASSWORD_REGEXP = /\A[a-zA-Z0-9]+\z/
  PHONE_REGEXP = /\A(|0[0-9]{9,10})\z/

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_jp
    validates :first_name_jp
  end

  validates :email, format: { with: EMAIL_REGEXP }, uniqueness: true
  validates :password, format: { with: PASSWORD_REGEXP }, length: { minimum: 7 }
  validates :phone_number, uniqueness: true, allow_nil: true, format: { with: PHONE_REGEXP }

  # Associations
  # has_many :credit_cards
  # has_many :transactions
  has_one :address
  # has_many :likes
  # has_many :comments
  has_many :products

  def shaping_data
    self.phone_number = phone_number.delete("-")
 end
end
