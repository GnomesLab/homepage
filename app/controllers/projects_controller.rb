class ProjectsController < ApplicationController
  respond_to :html

  # GET /projects
  def index
    @projects   = Project.reverse.paginate :page => params[:page], :per_page => Project.per_page
    respond_with @projects
  end

  # GET /projects/:category_id/:project_id
  def show
    @project = Project.find_by_friendly_id(params[:project_id])
    respond_with @project
  end
end
