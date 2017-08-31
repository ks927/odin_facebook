class LikesController < ApplicationController
    
  def index
      
  end
    
  def create
      @post = Post.find(params[:post_id])
      like = current_user.likes.build(post_id: params[:post_id])
      current_user.liked_posts << @post
      respond_to do |format|
        format.js 
        format.html { redirect_to posts_path }
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: params[:post_id])
    Like.destroy(like)
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js 
    end
  end
    
end
