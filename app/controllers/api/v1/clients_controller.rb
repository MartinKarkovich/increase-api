module Api
  module V1
    class ClientsController < ApplicationController

      def show
        @client = Client.find_by(client_id: params[:id]) || Services.process_client(params[:id])
      end
    end    
  end
end
