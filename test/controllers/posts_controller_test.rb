require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
     @user = users(:john)
     @post = @user.posts.build(content: "aaaaa") 
  end
    
  test "should be valid" do
     assert @post.valid? 
  end
    
  test "user_id should be present" do
     @post.user_id = nil
     assert_not @post.valid? 
  end
    
  test "should redirect create when not logged in" do
     assert_no_difference 'Post.count' do
       post posts_path, params: { post: { content: "aaaa" } }
     end
     assert_redirected_to new_user_session_path
  end
    
end
