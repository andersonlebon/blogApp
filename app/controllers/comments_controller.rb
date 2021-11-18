# create comments controller class
class CommentsController < ApplicationController
  # create comment for a post
  # new comment

  def new
    @user = current_user
    @comment = @user.posts.find(params[:post_id]).comments.new
  end

  # def create
  #   @user = User.find(params[:user_id])
  #   @comment = @user.posts.find(params[:post_id]).comments.create(comment_params)
  #   # redirect_to user_post_path(@user, @post)
  #   redirect_to user_post_path(@user, @comment.post)
  # end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(@comment.user, @comment.post)
      # notifies the user that the comment was created
      flash[:notice] = 'Comment created!'
    else
      render 'new'
    end
  end

  def destroy
    @user = current_user
    @comment = @user.posts.find(params[:post_id]).comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted'

    redirect_to user_post_path(@user, @comment.post)
  end

  # private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
