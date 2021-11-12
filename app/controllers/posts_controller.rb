class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  # create a new post
  def create
    @user = User.find(params[:user_id]) # find the user
    @post = @user.posts.create(post_params) # create a new post for the user
    redirect_to user_posts_path(@user) # redirect to the user's posts
  end
  

  def new
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
