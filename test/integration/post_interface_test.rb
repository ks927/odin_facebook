require 'test_helper'

class PostInterfaceTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
    @post = posts(:orange)
    @comment = comments(:one)
  end
    
  test "post interface test" do
    sign_in @user
    get root_path
    # Invalid submission
    assert_no_difference '@user.posts.count' do
      @user.posts.create(content: "")
    end
    # Valid submission
    assert_difference '@user.posts.count', 1 do
      post = @user.posts.create(content: "lorem ipsum")
    end
    # Delete post
    assert_difference '@user.posts.count', -1 do
      delete post_path(id: @post.id)
    end
  end
    
end
