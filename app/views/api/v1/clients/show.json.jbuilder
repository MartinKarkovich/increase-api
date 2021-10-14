if @client
  json.client_id @client.client_id
  json.email @client.email
  json.first_name @client.first_name
  json.last_name @client.last_name
  json.job @client.job
  json.country @client.country
  json.address @client.address
  json.zip_code @client.zip_code
  json.phone @client.phone
else
  json.error "Client not found."
end