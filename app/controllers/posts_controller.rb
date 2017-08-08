class PostsController < ApplicationController
  before_action :authenticate_user!
    
  def create
      @post = current_user.posts.build(post_params)
      if @post.save
         flash[:success] = "Posted."
         redirect_to 'root_url'
      else
          render 'users/new'
      end
  end
    
  def destroy
      
  end
    
  private
    
  def post_params
     params.require(:post).permit(:content) 
  end
    
end
