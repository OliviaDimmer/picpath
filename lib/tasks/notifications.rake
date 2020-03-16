namespace :notifications do
  desc "Sends upcoming shoot notifications to users"
  task :send => :environment do
    User.all.each do |user|
      UserMailer.reminder_email(user).deliver
    end
  end
end
