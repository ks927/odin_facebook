require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
     @user = users(:john) 
  end
    
 test "profile page" do
   get new_user_session_path
   @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))

   post user_session_path, params: { user: { email: @david.email, password: @david.password } }
   get posts_path
   assert_equal 302, status
   #assert_select 'h1', text: @david.first
 end
    
end
