if @client  
  json.data do 
    @client.payments.each do |payment|
      json.array! payment.transactions do |transaction|
        json.transaction_id transaction.transaction_id
        json.amount transaction.amount
        json.type transaction.transaction_type
      end
      
      json.array! payment.discounts do |discount|
        json.discount_id discount.discount_id
        json.amount discount.amount
        json.type discount.discount_type
      end
    end
  end
  
else
  json.error "Client not found."
end