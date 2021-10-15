module Api
  module V1
    class PaymentsController < ApplicationController

      def show
        if @client
          @due_to_collect_usd = @client.payments.due_to_collect.usd.sum("total")/100.0
          @due_to_collect_ars = @client.payments.due_to_collect.ars.sum("total")/100.0
          @collected_usd = @client.payments.collected.usd.sum("total")/100.0
          @collected_ars = @client.payments.collected.ars.sum("total")/100.0
        else
          render template: 'api/v1/shared/_client_not_found.json.jbuilder', status: :not_found
        end
      end
    end    
  end
end
