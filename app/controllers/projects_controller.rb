class ProjectsController < ApplicationController
  before_filter :sanitize_date_input, :only => [:create, :update]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id].to_i
    respond_to :html
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
      redirect_to @project
    else
      flash[:error] = "No Bueno"
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Peace." if Project.destroy params[:id].to_i
    redirect_to projects_path
  end

  private

    def sanitize_date_input
      %w(start_date end_date).each do |field_name|
        if params[:project] and params["project"]["#{field_name}(1i)"].blank?
          (1..3).each {|date_part| params["project"].delete("#{field_name}(#{date_part}i)")}
          params[:project][field_name.to_sym] = nil
        end
      end
    end
end