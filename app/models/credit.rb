class Credit < ApplicationRecord

  #Associations
  belongs_to :user, optional: true
  
  # Validations
  validates :customer_id, presence: true
  validates :card_id, presence: true
  
end
