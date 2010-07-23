class StaticPagesController < ApplicationController
  # GET /
  def homepage
    render 'static_pages/homepage/homepage'
  end

  # GET /about
  def about
  end

  # GET /services
  def services
  end

  # GET /projects
  def projects
  end

  # GET /blog
  def blog
  end

  # GET /services
  def services
  end

  # GET /service_details
  # FIXME: this route should never exist /services/:id is the correct route
  def service_details
  end

  # GET /post_view
  # FIXME: this route should never exist /posts/:id is the correct route
  def post_view
  end

  # GET /post_create
  # FIXME: this route should never exist /posts/new is the correct route
  def post_create
  end

  # GET /project_detail
  # FIXME: this route should never exist /projects/:id is the correct route
  def project_detail
  end

  # GET /sitemap
  def sitemap
  end
end
