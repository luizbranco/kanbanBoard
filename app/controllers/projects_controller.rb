class ProjectsController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource

  def index
    @projects = current_user.projects
    @invitations = current_user.invitations
  end

  def show
    @project = Project.find(params[:id])
    @statuses = @project.statuses
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      current_user.projects << @project
      redirect_to projects_path, :notice => 'Project Created!'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to projects_path, :notice => 'Project Updated!'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path, :notice => 'Project Deleted!'
    else
      render :index
    end
  end

  private

end

