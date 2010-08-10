class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :edit, :update, :destroy]

  respond_to :html

  # GET /blog
  # GET /posts
  def index
    if user_signed_in?
      @posts = Post.order("updated_at desc").paginate :page => params[:page], :per_page => Post.per_page
    else
      @posts = Post.where(:visible => true).order("updated_at desc").paginate :page => params[:page],
        :per_page => Post.per_page
    end

    respond_with @posts
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id]) || Post.last
    @post.increment

    respond_with @post
  end

  # GET /posts/new
  def new
    @post = Post.new(params[:post])

    respond_with @post
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    # FIXME: respond_with
    if @post.save
      redirect_to blog_path
      flash[:notice] = "The post was successfully created"
    else
      flash.now[:error] = "Oops! Your message could not be sent.
       Please check your input and try again."
      render :new
    end
  end

  # GET /post/:id/edit
  def edit
    @post = Post.find(params[:id])
    respond_with @post
  end

  # PUT /post/:id
  def update
    @post = Post.find(params[:id])

    # FIXME: respond_with
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /post/:id
  # FIXME: null exception
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Hasta la vista post!"
    redirect_to posts_url
  end

  # GET /post/tagged/:tag_name
  #
  # FIXME: remove the @title
  def tags
    @title = ActsAsTaggableOn::Tag.find_by_name params[:tag_name]
    @posts = Post.tagged_with(params[:tag_name]).latest.paginate :page => params[:page], :per_page => Post.per_page

    respond_with @posts
  end
end
