require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to shoots URL on login" do
    post '/auth/:provider/callback', params: OmniAuth.config.mock_auth[:google]
    assert_redirected_to shoots_url
  end

  test "first-time login should create a new user record" do
    assert_difference('User.count') do
      # post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
      post '/auth/:provider/callback', params: OmniAuth.config.add_mock(:google, {uid: '22222'})

      assert_equal(session[:uid],'22222')
    end
  end

  test "user should be able to logout" do
    get logout_url
    assert_nil(session[:uid])
  end
end
