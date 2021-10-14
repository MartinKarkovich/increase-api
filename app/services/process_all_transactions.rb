class ProcessAllTransactions

  def self.run
    lines = Fetch.transactions
    current_payment = nil

    lines.size.times do |i|
      if lines[i][0] == '4'
        footer_params = Parse.footer(lines[i])
        client = Client.find_by(client_id: footer_params[:client_id]) || Services.process_client(footer_params[:client_id])

        current_payment = Payment.new(footer_params)
        j = i
        j -= 1 until lines[j][0] == '1'

        header_params = Parse.header(lines[j])
        if Payment.find_by(payment_id: header_params[:payment_id])
          current_payment = Payment.find(header_params[:payment_id])
        else
          current_payment.assign_attributes(header_params)
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
end