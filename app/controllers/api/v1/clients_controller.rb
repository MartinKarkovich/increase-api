module Api
  module V1
    class ClientsController < ApplicationController

      def show
        unless @client
          render template: 'api/v1/shared/_client_not_found.json.jbuilder', status: :not_found
        end
      end
    end    
  end
end
