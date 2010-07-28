class ProjectsController < ApplicationController
  def index
    Project.recent.paginate :page => params[:page], :per_page => Project.per_page
  end
end