class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts 

    @post_comments = @posts.map do |post|
     {:id => post.id, :comments => post.comments.all}
    end

  end


  # create a new post
  def create
    @user = User.find(params[:user_id]) # find the user
    @post = @user.posts.create(post_params) # create a new post for the user
    redirect_to user_posts_path(@user) # redirect to the user's posts
  end
  

  # new post

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new 
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments  # find all comments for this post

  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
