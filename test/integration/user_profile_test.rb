require 'test_helper'

class UserProfileTestTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
     @user = users(:john) 
     @post = posts(:orange)
  end
    
  test "profile display" do
      sign_in @user
      get user_path(@user)
      assert_select 'h1', text: @user.username 
      assert_select 'h1>img.gravatar'
      @user.posts.each do |post|
           assert_match post.content, response.body 
      end
  end
    
  test "post can be liked" do
    assert_difference '@post.likes.count', 1 do
      @user.likes.create(post_id: @post.id)
    end
  end
    
end
