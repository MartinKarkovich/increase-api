class Fetch
  @@headers = { Authorization: Rails.application.credentials.bearer_token }
  @@base_uri = 'https://increase-transactions.herokuapp.com'
  @@client_uri = '/clients'
  @@transaction_uri = '/file.txt'

  def self.transactions
    begin
      retries ||= 0
      res = RestClient.get(
        @@base_uri + @@transaction_uri,
        headers = @@headers
      )
      transactions = res.body.split(/\n+/)

    rescue Exception => e
      retries += 1
      retry if (retries <= 5)
      raise e.message
    end

  end

  def self.client(client_id)
    begin
      retries ||= 0
      res = RestClient.get(
        @@base_uri + @@client_uri + "/#{client_id}",
        headers = @@headers
      )

      JSON.parse(res.body)

    rescue Exception => e
      retries += 1
      retry if (retries <= 5)
      raise e.message
    end

  end
end