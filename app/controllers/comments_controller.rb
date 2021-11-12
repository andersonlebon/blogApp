# create comments controller class  
class CommentsController < ApplicationController
  # create index method
  def index
     @user = User.find(params[:user_id])
    @comments = @user.posts.find(params[:id]).comments
  end
  # create new method
  # def new
  #   # create new comment
  #   @comment = Comment.new
  # end

  # # create create method
  # def create
  #   # create new comment
  #   @comment = Comment.new(comment_params)
  #   # if comment is saved
  #   if @comment.save
  #     # redirect to comments index
  #     redirect_to comments_path
  #   else
  #     # render new
  #     render :new
  #   end
  # end


end