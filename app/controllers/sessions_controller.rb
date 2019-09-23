class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    # @provider_hash = request.env['omniauth.auth'].to_json
    omni = request.env['omniauth.auth']
    @user = User.find_or_create_by(uid: omni['uid']) do |user|
      user.name = omni['info']['name']
      user.email = omni['info']['email']
    end
    self.current_user = @user
    redirect_to posts_url
  end
  def login
  end
  def logout
    reset_session
    redirect_to login_url, notice: "You have been logged out."
  end
end
