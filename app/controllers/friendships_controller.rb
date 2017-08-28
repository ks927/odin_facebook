class FriendshipsController < ApplicationController
    
  def index
     @friendships = current_user.all_friends 
  end
    
  def show 
     @user = User.find(params[:id]) 
     @friendships = @user.all_friends
  end
    
  # Send request
  def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
         flash[:success] = "Friend request sent!"
         redirect_to root_url
      else
         flash[:error] = "Unable to request friend :("
         redirect_to :back
      end
  end

  # Accept or decline request
  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update_attributes(accepted: true)
    flash[:success] = "Successfully confirmed friend!" 
    redirect_to root_url
  end

  # Defriend
  def destroy
    @friendship = current_user.friendships.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "Defriended"
    redirect_to root_url
  end
    
end
