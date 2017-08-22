class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
    
  def index
     if user_signed_in?
          @post = current_user.posts.build
          @feed_items = current_user.feed
     end 
  end
    
  def create
      @post = current_user.posts.build(post_params)
      if @post.save
         flash[:success] = "Posted."
         redirect_to request.referrer || posts_path
      else
          @feed_items = []
          render 'posts/index'
      end
  end
    
  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to request.referrer || root_url
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
