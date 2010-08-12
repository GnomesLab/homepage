class CategoriesController < ApplicationController
  respond_to :html

  # GET /projects/:category_id
  def show
    @category = Category.find_by_friendly_id(params[:category_id])
    @projects   = @category.projects.reverse.paginate :page => params[:page], :per_page => Project.per_page

    respond_with @projects
  end
end
