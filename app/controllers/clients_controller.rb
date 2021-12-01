class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :error_message

  def index
    clients = Client.all
    render json: clients
  end 

  def show
    client = find_client
    render json: client
  end
  
  private

  def find_client
    Client.find(params[:id])
  end 

  
  def error_message
    render json: { error:"could not find"}, status: :not_found
  end 
end
