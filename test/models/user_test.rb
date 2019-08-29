require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must have a name" do
    @user = users(:missing_name)
    refute @user.save
    @user.name = 'OK, You Have a Name'
    assert @user.save
  end
end
