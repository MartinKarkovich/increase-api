Rails.application.routes.draw do
  namespace 'api' do 
    namespace 'v1' do
      get '/clients/:id', to: 'clients#show'

      get '/clients/:id/balance', to: 'payments#show'

      get '/clients/:id/transactions', to: 'transactions#show'
    end
  end
end
