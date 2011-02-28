class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new params[:client]
    if @client.save
      flash[:success] = "Cool."
      redirect_to clients_path
    else
      flash[:error] = "No Bueno"
      render "new"
    end
  end

  def edit
    @client = Client.find params[:id].to_i
  end

  def update
    @client = Client.find params[:id].to_i
    @client.attributes = params[:client]
    if @client.save
      flash[:success] = "Cool."
      redirect_to clients_path
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Client.destroy params[:id].to_i
    redirect_to clients_path
  end
end
