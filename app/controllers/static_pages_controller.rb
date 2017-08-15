class StaticPagesController < ApplicationController
    
  def pending
    @friend_requests = current_user.inverse_friendships.pending
    @friends_pending = current_user.pending
  end

  def friends
  end

  def about
  end
end
