require 'test_helper'

class PostTest < ActiveSupport::TestCase
    
  def setup
     @user = users(:john)
     @post = @user.posts.build(content: "aaaa")
  end
  
  test "post should be valid" do
     assert @post.valid?
  end
    
  test "user_id should be present" do
     @post.user_id = nil
     assert_not @post.valid? 
  end
    
  test "posts should be youngest to oldest" do
     assert_equal posts(:most_recent), Post.first 
  end
    
end
