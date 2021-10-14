class Transaction < ApplicationRecord
  self.primary_key = :transaction_id

  belongs_to :payment, primary_key: :payment_id
  
  enum transaction_type: {
    approved: 1,
    disapproved: 2
  }

end