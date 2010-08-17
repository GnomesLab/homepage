class StaticPagesController < ApplicationController
  # GET /
  def home
    render 'static_pages/home/home'
  end

  # GET /about
  def about_us
    render 'static_pages/about_us/about_us'
  end

  # GET /service
  def services
    render 'static_pages/services/services'
  end

  # GET /sitemap
  def sitemap
  end
end
