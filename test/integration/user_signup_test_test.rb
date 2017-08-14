require 'test_helper'

class UserSignupTestTest < ActionDispatch::IntegrationTest

  test "should sign up user" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
            post user_registration_path, params: { user: { first: "Example", last: "User", email: "user@example.com", password: "password", password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'posts/index'
  end
    
end
