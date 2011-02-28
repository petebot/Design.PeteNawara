class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    if @project.save
      flash[:success] = "Cool."
      redirect_to projects_path
    else
      flash[:error] = "No Bueno"
      render "new"
    end
  end

  def edit
    @project = Project.find params[:id].to_i
  end

  def update
    @project = Project.find params[:id].to_i
    @project.attributes = params[:project]
    if @project.save
      flash[:success] = "Cool."
      redirect_to projects_path
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Project.destroy params[:id].to_i
    redirect_to projects_path
  end
end
