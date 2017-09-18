class UsersController < ApplicationController
   before_action :authenticate_user!
    
    def create
      @user = User.create(user_params)
    end

    def new 
        @user = User.new
        if user_signed_in?
          @post = current_user.posts.build
          @posts = current_user.posts
          @feed_items = current_user.feed
        end
    end
    
    def show 
       @user = User.find(params[:id]) 
       @post = @user.posts.build if user_signed_in?
       @posts = @user.posts 
       @feed_items = @user.home_feed
    end
    
    def edit
      @user = User.find(params[:id])
      if @user != current_user
         flash[:danger] = "You may not edit other users info."
         redirect_to @user
      end
    end
    
    def update
      @user = User.find(params[:id])
      if current_user.update_attributes(user_params)
         flash[:success] = "Profile updated"
         redirect_to @user
      else
         render 'edit'
      end
 
    end
    
    def index
       @users = User.all 
    end
    
    private
    
    def user_params
       params.require(:user).permit(:first, :last, :email, :password, :password_confirmation, :birthday, :employer, :school, :residence, :avatar) 
    end
    
end
