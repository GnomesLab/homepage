# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'application'

  helper_method :friendly_post_path, :tweet_path

  before_filter :ensure_domain

  # Generates a friendly url path for a given instance of Post.
  #
  # Urls are generated based on the value of Post#published_at, and will look something like this:
  #   /blog/2010/01/10-my-post-title
  #
  # Usage example:
  #   class PostsController < ApplicationController
  #     ...
  #     redirect_to friendly_post_path(Post.first)
  def friendly_post_path(post = nil)
    return nil unless post.is_a? Post

    post.published? ? friendly_post_show_path(post.created_at.year,
                                              "%02d" % post.published_at.month,
                                              "#{post.friendly_id}") :
                      post_path(post)
  end

  def tweet_path(id)
    "http://twitter.com/gnomeslab/status/#{id}"
  end

  private
    # Redirects the current request to http://gnomeslab.com unless:
    #   * the current env is not set to production
    #   * the request already has gnomeslab.com as HTTP_HOST
    def ensure_domain
      if Rails.env == 'production' && request.env['HTTP_HOST'] != 'gnomeslab.com'
        redirect_to 'http://gnomeslab.com'
      end
    end
end