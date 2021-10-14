if @client  
  json.data do 
    byebug
    json.array! @transactions do |transaction|
      json.transaction_id transaction.transaction_id
      json.amount transaction.amount
      json.type transaction.transaction_type
    end
    
    json.array! @discounts do |discount|
      json.discount_id discount.discount_id
      json.amount discount.amount
      json.type discount.discount_type
    end
  end
  
else
  json.error "Client not found."
end