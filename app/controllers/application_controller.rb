class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  # Getter method for current user
  def current_user
    @current_user ||= User.find_by(uid: session[:uid])
  end
  # Setter method for current user
  def current_user=(user)
    session[:uid] = user.uid
    session[:name] = user.name
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to login_url, notice: "Please log in first"
    end
  end

  protected

  def after_sign_in_path_for(resource)
    edit_user_path
  end

  # def after_sign_out_path_for(resource)
  #   # return the path based on resource
  # end
end
