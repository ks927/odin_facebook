class StaticPagesController < ApplicationController
    
  def pending
    @friend_requests = current_user.requested_friendships 
  end

  def friends
  end

  def about
  end
end
