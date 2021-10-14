class Parse

  def self.header(header)
    { 
      payment_id: header[1..32],
      currency: header[36..38],
      full_amount: header[39..51],
      full_discounts: header[52..64],
      total: header[65..77]
    }
  end

  def self.footer(footer)
    {
      date: footer[16..23],
      client_id: footer[24..55]
    }
  end

  def self.transaction(transaction)
    {
      transaction_id: transaction[1..32],
      amount: transaction[33..45],
      transaction_type: transaction[51].to_i
    }
  end

  def self.discount(discount)
    {
      discount_id: discount[1..32],
      amount: discount[33..45],
      discount_type: discount[49].to_i
    }
  end



end