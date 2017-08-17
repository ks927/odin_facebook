require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
     @user = users(:john) 
  end
    
  test "sign in user" do
     get new_user_session_path
     sign_in @user
     get '/posts#index'
     assert_response :success
     assert_select 'a[href = ?]', user_path(@user)
     assert_select 'a[href = ?]', root_url
     assert_select 'a[href = ?]', pending_path
  end
    
end
