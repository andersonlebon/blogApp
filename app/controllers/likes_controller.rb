# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    # @like = Like.new
    # @like.user_id = params[:user_id]
    # @like.post_id = params[:post_id]
    # @like.save
    # increement the like count for the post
    # @post = Post.find(params[:post_id])
    # @post.likes += 1
    # @post.save

    # redirect_to :back
    @user = current_user
    @post = @user.posts.find(params[:post_id])
    @liked = @post.liked
    @is_liked = @liked ? true : false
    @post.liked = !@is_liked
    # @post.likes += @is_liked ? -1 : 1
    @post.save
    if @is_liked
      @like = @post.likes.create(user_id: params[:user_id], post_id: params[:post_id])
    else
      @like = @post.likes.find_by(user_id: params[:user_id], post_id: params[:post_id])
      if @like
        @like.destroy
      else
        @like = @post.likes.create(user_id: params[:user_id], post_id: params[:post_id])
      end
    end
    redirect_to user_post_path(@user, @post)
  end

  # delete a like for a post
  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to :back
  end

  def like_params
    params.require(:likes).permit(:user_id, :post_id)
  end
end
