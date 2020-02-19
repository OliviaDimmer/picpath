every 1.day, :at => "9am" do
  rake "notifications:send"
end
