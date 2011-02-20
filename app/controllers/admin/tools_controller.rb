class Admin::ToolsController < ApplicationController
  def index
    @tools = Admin::Tool.all
  end

  def new
    @tool = Admin::Tool.new
  end

  def create
    @tool = Admin::Tool.new params[:admin_tool]
    if @tool.save
      flash[:success] = "Cool."
      redirect_to admin_tools_path
    else
      flash[:error] = "No Bueno"
      render "new"
    end
  end

  def edit
    @tool = Admin::Tool.find params[:id].to_i
  end

  def update
    @tool = Admin::Tool.find params[:id].to_i
    @tool.attributes = params[:admin_tool]
    if @tool.save
      flash[:success] = "Cool."
      redirect_to admin_tools_path
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Admin::Tool.destroy params[:id].to_i
    redirect_to admin_tools_path
  end
end
