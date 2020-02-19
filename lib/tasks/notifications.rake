namespace :notifications do
  desc "Sends daily notifications to users"
  task :send => :environment do
    User.all.each do |user|
      UserMailer.daily_stakeholder_events_to_user(user).deliver
    end
  end
end
