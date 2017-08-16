class LikesController < ApplicationController
    
  def index
      
  end
    
  def create
      @post = Post.find_by(id: params[:post_id])
      @like = current_user.likes.build(post_id: params[:post_id])
      @like.save
      redirect_to :back
      #format.respond_to do |format|
       #  format.html { redirect_to @post }
        # format.js
      #end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    Like.destroy(@like)
    redirect_to :back
    #format.respond_to do |format|
     # format.html { redirect_to @post }
     # format.js
    #end
  end
    
end
