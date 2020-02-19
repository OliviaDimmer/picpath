class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to PicPath!')
  end

  def daily_stakeholder_events_to_user(user)
      user.email = "email@example.com"
      subject = "Your daily roundup"
      @user = user
      @shoots = []

      email_with_name = "#{@user.name} <#{@user.email}>"
      puts "Emailing #{subject} to #{email_with_name}"
      mail(:to => email_with_name, :subject => subject)
    end

end
