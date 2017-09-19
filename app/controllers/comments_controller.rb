class CommentsController < ApplicationController
  before_action :authenticate_user!
    
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(content: params[:comment][:content], user_id: current_user.id)
      respond_to do |format|
           #format.js 
           format.html { redirect_to request.referrer || root_url }
         end
  end

  def destroy
      Comment.find(params[:id]).destroy
      redirect_to request.referrer || posts_path
  end
    
end
