class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = @user.posts

    @post_comments = @posts.map do |post|
      { id: post.id, comments: post.comments.all }
    end
  end

  # create a new post
  def create
    @user = current_user
    # validate post params
    @post = @user.posts.create(post_params) # create a new post for the user
    # count user's posts
    @post.comments_counter = @post.comments.count
    @post.like_counter = @post.likes.count
    # @user.posts.count
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to user_posts_path(@user.id)
    else
      flash.now[:alert] = 'Failed to create post!'
      render :new
    end
    # redirect_to user_posts_path(@user) # redirect to the user's posts
  end

  # destroy a post of the current user
  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.comments.destroy_all
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to user_posts_path(@user)
  end
  # new post

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def show
    @user = current_user
    @post = @user.posts.find(params[:id])
    @comments = @post.comments # find all comments for this post
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
