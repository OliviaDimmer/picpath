class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    # log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    # self.current_user = @user
    redirect_to shoots_url
  end
  def login
  end
  def logout
    reset_session
    redirect_to login_url, notice: "You have been logged out."
  end
  # def authenticate_user
  #   unless user_signed_in?
  #     redirect_to google_auth_url(origin: request.url)
  #   end
  end
end
