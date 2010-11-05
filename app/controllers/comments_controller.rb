# encoding: UTF-8

class CommentsController < ApplicationController
  # Filters
  before_filter :authenticate_user!, :only => [:update]

  respond_to :html

  # POST /posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = "Comment was successfully created."
    else
      flash[:error] = "Oops! Your comment could not be created."
    end

    respond_with @post
  end

  # POST /posts/:post_id/comment/:id
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(:visible => params[:visible])
      flash[:notice] = "Comment was successfully updated."
    else
      flash[:error] = "Oops! Your comment could not be updated."
    end

    respond_with @post
  end

end