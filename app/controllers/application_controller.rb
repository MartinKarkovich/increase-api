class ApplicationController < ActionController::API
  before_action :set_client
  
  def set_client
    @client = Client.find_by(client_id: params[:id])
  end
end
