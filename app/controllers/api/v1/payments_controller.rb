module Api
  module V1
    class PaymentsController < ApplicationController

      def show
       @due_to_collect = @client.payments.due_to_collect.sum("total")
       @collected = @client.payments.collected.sum("total")
      end
    end    
  end
end
