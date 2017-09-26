class CommentsController < ApplicationController
  before_action :authenticate_user!
    
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      respond_to do |format|
        format.js 
        format.html { redirect_back(fallback_location: request.referrer) }
      end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to request.referrer || posts_path }
      end
  end
    
  private

  def comment_params
      params.permit(:user_id, :content)
  end

    
end
