require 'test_helper'

class FriendingTest < ActionDispatch::IntegrationTest
=begin
  def setup
     @user = users(:john) 
     @other_user = users(:carl)
      sign_in @user
  end
    
  test "should friend a user" do
    assert_difference '@user.friends_pending', 1 do
      post friendship_path, params([friend_id: @user.id]) 
    end
  end
=end
end
