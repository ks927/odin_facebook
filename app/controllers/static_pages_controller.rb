class StaticPagesController < ApplicationController
    
  def pending
    @friend_requests = current_user.requested_friendships
    @friends_pending = current_user.pending_friends
  end

  def friends
  end

  def about
  end
end
