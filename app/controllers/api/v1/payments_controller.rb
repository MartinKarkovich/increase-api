module Api
  module V1
    class PaymentsController < ApplicationController

      def show
        if @client
          @due_to_collect = @client.payments.due_to_collect.sum("total")
          @collected = @client.payments.collected.sum("total")
        else
          render template: 'api/v1/shared/_client_not_found.json.jbuilder', status: :not_found
        end
      end
    end    
  end
end
