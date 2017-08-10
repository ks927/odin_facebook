class FriendshipsController < ApplicationController
    
  # Send request
  def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
         flash[:success] = "Friend request sent!"
         redirect_to :back
      else
         flaseh[:error] = "Unable to request friend :("
         redirect_to :back
      end
  end

  # Accept or decline request
  def update
    @friendship = Friendships.find_by(id: params[:id])
    @friendship.update(status: "accepted")
    if @friendship.save
       redirect_to root_url, notice: "Successfully confirmed friend!" 
    else
      redirect_to root_url, notice: "Sorry, unable to confirm friend." 
    end
  end

  # Defriend
  def destroy
    @friendship = Friendships.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "Defriended"
    redirect_to :back
  end
    
end
