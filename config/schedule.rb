every 1.day, :at => "5am" do
  rake "notifications:send"
end
