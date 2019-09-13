require 'test_helper'

class ShootTest < ActiveSupport::TestCase
  test "shoot must have a slug" do
    @shoot = shoots(:missing_slug)
    refute @shoot.save
    @shoot.slug = 'OK, You Have a Slug'
    assert @shoot.save
  end

  test "shoot responds to user_name getter" do
    @shoot = shoots(:one)
    assert_equal @shoot.user_name, shoots(:one).user.name
  end

  test "shoot responses to user_name setter" do
    @shoot = shoots(:one)
    @shoot.user_name = users(:one).name
    @shoot.save
    assert_equal @shoot.user_name, users(:one).name
  end
end
