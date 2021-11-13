# create comments controller class  
class CommentsController < ApplicationController
  # create comment for a post
# new comment

  def new
    @user = User.find(params[:user_id])
    @comment = @user.posts.find(params[:id]).comments.new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.posts.find(params[:id]).comments.create(comment_params)
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
 


end