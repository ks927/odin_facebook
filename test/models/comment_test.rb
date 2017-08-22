require 'test_helper'

class CommentTest < ActiveSupport::TestCase
    
  def setup
     @post = posts(:orange)
     @user = users(:john)
     @comment = @post.comments.create(user_id: @user.id, content: "hello world") 
  end
  
  test "should have user_id" do
    assert @comment.valid?
  end
    
  test "should have content" do
    assert @comment.valid?
  end
    
end
