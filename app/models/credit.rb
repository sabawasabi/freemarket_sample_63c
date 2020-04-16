class Credit < ApplicationRecord

  #Associations
  belongs_to :user
  
  # Validations
  # validates :costomer, presence: true
  # validates :card, presence: true


end
