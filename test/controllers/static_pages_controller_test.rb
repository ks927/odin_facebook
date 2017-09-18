require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
     @user = users(:john) 
  end
    
  test "should get pending" do
    sign_in @user
    get pending_path
    assert_response :success
  end

  test "should get friends" do
    get static_pages_friends_url
    assert_response :success
  end

  test "should get about" do
    get user_about_path(@user.id)
    assert_response :success
  end

end
