require 'test_helper'

class CommentCreationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

   def setup
    @user = users(:john)
    @post = posts(:orange)
    @comment = comments(:one)
  end
    
  test "comment interface" do
    sign_in @user
    get root_path
    # Invalid submission
    assert_no_difference '@post.comments.count' do
      @post.comments.create(user_id: @user.id, content: "")
    end
    # Valid submission
    assert_difference '@post.comments.count', 1 do
      @post.comments.create(user_id: @user.id, content: "lorem")
    end
    # Delete comment
    assert_difference '@post.comments.count', 0 do
      delete post_comment_path(@post.id, commentable_id: @post.id, id: @comment.id)
    end
  end
    
end
