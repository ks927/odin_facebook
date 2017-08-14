class FriendshipsController < ApplicationController
    
  def index
     @friendships = current_user.friendships 
  end
    
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
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update_attribute(accepted: true)
    if @friendship.save
       redirect_to root_url, notice: "Successfully confirmed friend!" 
    else
      redirect_to root_url, notice: "Sorry, unable to confirm friend." 
    end
  end

  # Defriend
  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "Defriended"
    redirect_to :back
  end
    
end
