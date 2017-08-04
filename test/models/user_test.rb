require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
       @user = User.new(first: "first", last: "last", email: "user@example.com", password: "foobar", password_confirmation: "foobar") 
    end
  
  test "user should be valid" do
      assert @user.valid?
  end
    
  test "first should be present" do
    @user.first = ""
    assert_not @user.valid? 
  end
    
  test "last should be present" do
    @user.last = ""
    assert_not @user.valid? 
  end
    
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid? 
  end
    
  test "password must be nonblank" do
    @user.password = "     "
    assert_not @user.valid? 
  end
    
  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid? 
  end
    
  test "password should match psasword_confirmation" do
    @user.password = "a" * 6
    @user.password_confirmation = "b" * 6
    assert_not @user.valid? 
  end
    
end
