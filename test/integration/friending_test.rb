require 'test_helper'

class FriendingTest < ActionDispatch::IntegrationTest
  def setup
     @user = users(:john) 
     @other_user = users(:carl)
      #sign_in @user
  end
    
  test "should friend/defriend a user" do
    # Send friend request
    assert_difference '@user.pending_friends.count', 1 do 
      @user.friendships.create(user_id: @user.id, friend_id: @other_user.id)
    end
    # Receive request
    assert_difference '@other_user.inverse_friendships.pending.count', 1 do
      @user.friendships.create(user_id: @user.id, friend_id: @other_user.id)
    end
    # Accept request
    assert_difference '@user.friends.count', 1 do
        friendship = @user.friendships.create(user_id: @user.id, friend_id: @other_user.id)
        friendship.update_attributes(accepted: true)
    end
  end
    
end
