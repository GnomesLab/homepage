class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

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

    # FIXME: change from created_at to published_at
    friendly_post_show_path post.created_at.year,
      post.created_at.month < 10 ? "0#{post.created_at.month.to_s}" : post.created_at.month.to_s,
      "#{post.id.to_s}-w"
  end
end
