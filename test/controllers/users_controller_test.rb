require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    
  def setup
    @user = users(:john)
    @other_user = users(:carl)
  end
    
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to new_user_session_path
  end
    
  test "should redirect edit when not logged in" do
     get edit_user_path(@user)
     assert_not flash.empty?
     assert_redirected_to new_user_session_path
  end
    
  test "should redirect edit when logged in as wrong user" do
     sign_in @other_user
     get edit_user_path(@user)
     assert_not flash.empty?
     assert_redirected_to user_path(@user)
   end
    
end
