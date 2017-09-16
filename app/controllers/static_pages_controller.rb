class StaticPagesController < ApplicationController
    
  def pending
    @friend_requests = current_user.inverse_friendships.pending
    @friends_pending = current_user.pending_friends
  end

  def friends
  end

  def about
    @user = User.find(params[:user_id])
  end
    
end
