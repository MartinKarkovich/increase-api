class Payment < ApplicationRecord
  has_many :transactions
  has_many :discounts
  belongs_to :client
  
end