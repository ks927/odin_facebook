class LikesController < ApplicationController
    
  def index
      
  end
    
  def create
      @post = Post.find(params[:post_id])
      like = current_user.likes.build(post_id: params[:post_id])
      current_user.liked_posts << @post
      respond_to do |format|
        format.js 
        format.html { redirect_to @post }
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.where(post: @post).first
    Like.destroy(like)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js 
    end
  end
    
end
