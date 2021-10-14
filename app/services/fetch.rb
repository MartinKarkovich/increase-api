class Fetch
  @@headers = { Authorization: Rails.application.credentials.bearer_token }
  @@base_uri = 'https://increase-transactions.herokuapp.com'
  @@client_uri = '/clients'
  @@transaction_uri = '/file.txt'

  def self.transactions
    res = RestClient.get(
      @@base_uri + @@transaction_uri,
      headers = @@headers
    )

    transactions = res.body.split(/\n+/)
  end

  def self.client(client_id)
    res = RestClient.get(
      @@base_uri + @@client_uri + "/#{client_id}",
      headers = @@headers
    )
    JSON.parse(res.body)
  end
end