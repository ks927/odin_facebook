require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
     @post = posts(:orange) 
  end
    
  test "should redirect create when not logged in" do
     assert_no_difference 'Post.count' do
       post posts_path, params: { post: { content: "aaaa" } }
     end
     assert_redirected_to new_user_session_path
  end
    
end
