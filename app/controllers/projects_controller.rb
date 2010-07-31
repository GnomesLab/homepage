class ProjectsController < ApplicationController
  respond_to :html

  # GET /projects
  def index
    @projects = Project.reverse.paginate :page => params[:page], :per_page => Project.per_page
    @categories = Category.ordered_by_name

    respond_with @projects
  end

  # GET /projects/:id-:name
  def show

  end
end
