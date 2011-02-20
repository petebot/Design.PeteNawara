class Admin::ClientsController < ApplicationController
  def index
    @clients = Admin::Client.all
  end

  def new
    @client = Admin::Client.new
  end

  def create
    @client = Admin::Client.new params[:admin_client]
    if @client.save
      flash[:success] = "Cool."
      redirect_to admin_clients_path
    else
      flash[:error] = "No Bueno"
      render "new"
    end
  end

  def edit
    @client = Admin::Client.find params[:id].to_i
  end

  def update
    @client = Admin::Client.find params[:id].to_i
    @client.attributes = params[:admin_client]
    if @client.save
      flash[:success] = "Cool."
      redirect_to admin_clients_path
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Admin::Client.destroy params[:id].to_i
    redirect_to admin_clients_path
  end
end
