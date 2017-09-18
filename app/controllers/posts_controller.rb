class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
    
  def index
     if user_signed_in?
          @post = current_user.posts.build
          @feed_items = current_user.feed
          @like = current_user.likes.new
          @comment = Comment.new
     end 
  end
    
  def create
      @post = current_user.posts.build(post_params)
         respond_to do |format|
           format.js { @post.save }
           format.html { redirect_to request.referrer || root_url }
         end
  end
    
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to request.referrer || root_url }
    end
  end
    
  private
    
  def post_params
     params.require(:post).permit(:content) 
  end
    
  def correct_user
     @post = current_user.posts.find_by(id: params[:id]) 
     redirect_to root_url if @post.nil?
  end
    
end
