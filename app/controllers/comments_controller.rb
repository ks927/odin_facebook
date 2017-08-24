class CommentsController < ApplicationController
    
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(content: params[:comment][:content], user_id: current_user.id)
      redirect_to request.referrer || posts_path
  end

  def destroy
      Comment.find(params[:id]).destroy
      redirect_to request.referrer || posts_path
  end
    
end
