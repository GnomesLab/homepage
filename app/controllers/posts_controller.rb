class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  
  respond_to :html
  
  # GET /posts/id
  def show
    @post = Post.find(params[:id]) || Post.first
    @post.increment
    
    respond_with @post
  end
  
  # GET /blog
  def blog
    @posts = Post.reverse.paginate :page => params[:page], :per_page => Post.per_page
    
    respond_with @posts
  end
  
  # POST /posts/new
  def new
    @post = Post.new(params[:post])
    @post.user = current_user

    respond_with @post
  end
  
  # POST /posts
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    
    if @post.save
      redirect_to blog_path
      flash[:notice] = "The post was successfully created"
    else
      flash.now[:error] = "Oops! Your message could not be sent.
       Please check your input and try again."
      render :new
    end
  end
  
  # POST /post/id/edit
  def edit
    @post = Post.find(params[:id])
    @post.user = current_user
  end
  
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  # splat
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Hasta la vista post!"
    redirect_to posts_url
  end
end