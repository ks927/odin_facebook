require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  #test "should get pending" do
   # get pending_url
    #assert_response :success
 # end

  test "should get friends" do
    get static_pages_friends_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end
