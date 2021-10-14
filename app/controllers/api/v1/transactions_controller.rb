module Api
  module V1
    class TransactionsController < ApplicationController

      def show
        @transactions = []
        @discounts = []
        @client.payments.each do |payment|
          @transactions += payment.transactions
        end
        @client.payments.each do |payment|
          @discounts += payment.discounts
        end
      end

    end    
  end
end
