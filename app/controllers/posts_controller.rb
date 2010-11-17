# encoding: UTF-8

class PostsController < ApplicationController
  # Filters
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  # Responders
  respond_to :html

  # Public actions

  # GET /blog
  #
  # Redirects:
  #   * Requests matching /^\/posts(\/?)$/ will be permanently redirected to the blog_path
  def index
    respond_with(@posts) do |format|
      format.html do
        return redirect_to blog_path, :status => 301 if request.path =~ /^\/posts(\/?)$/ && flash.empty?

        @posts = user_signed_in? ? Post.latest : Post.published.latest
        @posts = @posts.paginate :page => params[:page], :per_page => Post.per_page
      end

      format.rss { @posts = Post.published.latest }
    end
  end

  # GET /posts/:id
  #
  # Redirects:
  #   * Requests matching /^\/posts\/\d.+$/ will be permanently redirect to the corresponding friendly_post_path
  def show
    @post = Post.find_by_friendly_id(params[:id])
    if @post.nil? || !authorized?
      flash[:notice] = "Oops! The post you were trying to find is no longer available."
      return redirect_to blog_path
    end

    if @post.published? && request.path =~ /^\/posts/ && flash.empty?
      return redirect_to friendly_post_path(@post), :status => 301
    end

    @post.increment

    respond_with @post
  end

  # GET /posts/new
  def new
    debugger
    @post = Post.new(params[:post])

    respond_with @post
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was successfully created."
    else
      flash[:error] = "Oops! Your post could not be created."
    end

    respond_with @post
  end

  # GET /post/:id/edit
  def edit
    @post = Post.find(params[:id])

    respond_with @post
  end

  # PUT /post/:id
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully updated."
    else
      flash[:error] = "Oops! Your post could not be updated."
    end

    respond_with @post
  end

  # DELETE /post/:id
  def destroy
    if post = Post.find(params[:id]).try(:destroy)
      flash[:notice] = "Post was successfully deleted."
    else
      flash[:error] = "Oops! Your post could not be deleted."
    end

    respond_with post
  end

  # GET /post/tagged/:tag_name
  def tagged
    @tag = ActsAsTaggableOn::Tag.find_by_name params[:tag_name]
    @posts = Post.tagged_with(params[:tag_name]).latest.paginate :page => params[:page], :per_page => Post.per_page

    respond_with @posts
  end

  # GET blog/:year(/:month)
  def published_at
    @posts = Post.archive_node(:year => params[:year], :month => params[:month]).
      latest.
      paginate(:page => params[:page], :per_page => Post.per_page)

    if @posts.empty?
      flash[:notice] = "Oops! There are no posts on the requested archive."
      return redirect_to blog_path
    end

    respond_with @posts
  end

  protected
    def authorized?
      @post.published? || user_signed_in?
    end
end
