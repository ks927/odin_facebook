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
    
  test "content should be present" do
     @post.content = " "
     assert_not @post.valid? 
  end
    
  test "content should be at most 63206 characters" do
     @post.content = "a" * 63207
     assert_not @post.valid? 
  end
    
  test "posts should be youngest to oldest" do
     assert_equal posts(:most_recent), Post.first 
  end
    
end
