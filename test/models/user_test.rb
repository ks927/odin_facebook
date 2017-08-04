require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
       @user = User.new(first: "first", last: "last", email: "user@example.com", password: "foobar", password_confirmation: "foobar") 
    end
  
  test "user should be valid" do
      assert @user.valid?
  end
    
end
