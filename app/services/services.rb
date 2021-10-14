class Services

  def self.process_transactions(client_id)
    lines = Fetch.transactions
    current_payment = nil

    lines.size.times do |i|
      if lines[i][0] == '4' && lines[i].include?(client_id)
        current_payment = Payment.new(date: Parse.footer(lines[i])[:date], client_id: client_id)
        j = i
        j -= 1 until lines[j][0] == '1'

        if Payment.find_by(payment_id: Parse.header(lines[j])[:payment_id])
          current_payment = Payment.find(Parse.header(lines[j])[:payment_id])
        else
          current_payment.assign_attributes(Parse.header(lines[j]))
          current_payment.save
        end

        (j+1..i-1).each do |k|
          if lines[k][0] == '2'
            transaction_params = Parse.transaction(lines[k])
            unless Transaction.find_by(transaction_id: transaction_params[:transaction_id])
              transaction = Transaction.new(transaction_params)
              transaction.payment = current_payment
              transaction.save
            end
          else
            discount_params = Parse.discount(lines[k])
            unless Discount.find_by(discount_id: discount_params[:discount_id])
              discount = Discount.new(discount_params)
              discount.payment = current_payment
              discount.save
            end
          end
        end
      end
    end
  end

  def self.process_client(client_id)    
    client_params = Fetch.client(client_id)
    Client.create(client_params.merge({ client_id: client_params["id"]})) if client_params
  end
end

