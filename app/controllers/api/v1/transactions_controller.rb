module Api
  module V1
    class TransactionsController < ApplicationController

      def show
        @client = Client.find_by(client_id: params[:id]) || Services.process_client(params[:id])
        if @client
          Services.process_transactions(@client.client_id)          
        end
      end

    end    
  end
end
