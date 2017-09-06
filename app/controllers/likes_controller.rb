class LikesController < ApplicationController
    respond_to :js
    
  def create
      @post = Post.find(params[:post_id])
      #like = current_user.likes.build(post_id: params[:post_id])
      current_user.liked_posts << @post
      respond_to do |format|
        format.js
        format.html { redirect_to :back }
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post: @post)
    like.destroy
    respond_to do |format|
      format.js 
      format.html { redirect_back fallback_location: root_path }
    end
  end
    
end
