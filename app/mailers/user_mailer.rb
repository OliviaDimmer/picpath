class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to PicPath!')
  end

  def assigned_email
      @user = params[:user]
      @shoot = []

      mail(to: @user.email, subject: "You've been assigned a shoot.")
    end

end
