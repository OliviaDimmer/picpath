class Shoot < ApplicationRecord
  validates :slug, :assignment_description, :start, :end, :location, :contact_name, :contact_phone, :deadline, presence: true
  belongs_to :user

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end

  def user_name
    self.user ? self.user.name : nil
  end

  def to_ics
    shoot = Icalendar::Event.new
    shoot.start = self.date.strftime("%Y%m%dT%H%M%S")
    shoot.end = self.end_date.strftime("%Y%m%dT%H%M%S")
    shoot.assignment_description = self.assignment_description
    shoot.location = self.location
    shoot.klass = "PUBLIC"
    shoot.created = self.created_at
    shoot.last_modified = self.updated_at
    shoot.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
    event
  end
end
