class CategoriesController < ApplicationController
  respond_to :html

  # GET /projects/:category_id
  def show
    @category   = Category.find(params[:category_id])
    @projects   = @category.projects.reverse.paginate :page => params[:page], :per_page => Project.per_page
    @categories = Category.ordered_by_name

    respond_with @projects
  end
end
