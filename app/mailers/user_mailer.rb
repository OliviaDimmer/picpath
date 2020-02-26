class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to PicPath!')
  end

  def daily_stakeholder_events_to_user
      @user = params[:user]
      @shoots = []

      mail(to: @user.email, subject: "Here's your agenda for today.")
    end

end
