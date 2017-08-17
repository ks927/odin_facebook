require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:john)
    @other_user = users(:carl)
    @friendship = Friendship.new(user_id: @user.id, friend_id: @other_user.id)
  end
    
  test "friendship should be valid" do
     assert @friendship.valid? 
  end
    
end
