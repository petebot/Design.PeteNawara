class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new params[:tool]
    if @tool.save
      flash[:success] = "Cool."
      redirect_to tools_path
    else
      flash[:error] = "No Bueno"
      render "new"
    end
  end

  def edit
    @tool = Tool.find params[:id].to_i
  end

  def update
    @tool = Tool.find params[:id].to_i
    @tool.attributes = params[:tool]
    if @tool.save
      flash[:success] = "Cool."
      redirect_to tools_path
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Tool.destroy params[:id].to_i
    redirect_to tools_path
  end
end
