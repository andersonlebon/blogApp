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
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @like = @post.likes.create(user_id: params[:user_id], post_id: params[:post_id])
        # puts like_params
        # redirect to user post page
    
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
