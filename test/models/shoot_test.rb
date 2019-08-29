require 'test_helper'

class ShootTest < ActiveSupport::TestCase
  test "shoot must have a slug" do
    @shoot = shoots(:missing_title)
    refute @shoot.save
    @shoot.slug = 'OK, You Have a Title'
    assert @shoot.save
  end
end
