module Api
  module V1
    class TransactionsController < ApplicationController

      def show
        if @client
          @transactions = []
          @discounts = []
          @client.payments.each do |payment|
            @transactions += payment.transactions
          end
          @client.payments.each do |payment|
            @discounts += payment.discounts
          end

        else
          render template: 'api/v1/shared/_client_not_found.json.jbuilder', status: :not_found
        end
        
      end

    end    
  end
end
