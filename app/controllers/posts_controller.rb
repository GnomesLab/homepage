class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  
  respond_to :html
  
  def show
    @post = Post.find(params[:id]) || Post.first
    @post.increment
    
    respond_with @post
  end
  
  def blog
    render 'posts/blog'
  end
  
  def new
    @post = Post.new(params[:post])
    @post.user = current_user

    respond_with @post
  end
  
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
end