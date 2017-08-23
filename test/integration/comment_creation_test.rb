require 'test_helper'

class CommentCreationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

   def setup
    @user = users(:john)
    @post = posts(:orange)
  end
    
  test "should post create when logged in" do
    sign_in @user
    assert_difference '@post.comments.count', 1 do
      @post.comments.create(user_id: @user.id, content: "Lorem ipsum.")
    end
  end
    
end
