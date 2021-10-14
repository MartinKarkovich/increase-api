class Payment < ApplicationRecord
  self.primary_key = :payment_id

  has_many :transactions
  has_many :discounts
  belongs_to :client, primary_key: :client_id
  
  scope :due_to_collect, -> { where("date > ?", Time.now) }
  scope :collected, -> { where("date <= ?", Time.now) }

end