class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :friendly_post_path

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
end