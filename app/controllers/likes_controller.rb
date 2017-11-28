class LikesController < ApplicationController
    
  def create
      @post = Post.find(params[:post_id])
      #current_user.liked_posts << @post
      current_user.likes.create(post: @post)
      respond_to do |format|
        format.js
        format.html { redirect_back(fallback_location: request.referrer) }
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(id: params[:id])
    like.destroy 
    respond_to do |format|
      format.js {}
      format.html { redirect_to request.referrer || posts_path }
    end
  end
    
end
