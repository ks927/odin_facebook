class StaticPagesController < ApplicationController
    
  def pending
      @pending_friendships = current_user.requested_friendships
  end

  def friends
  end

  def about
  end
end
