class Shoot < ApplicationRecord
  validates :slug, :assignment_description, :start, :end, :location, :contact_name, :contact_phone, :deadline, presence: true
  belongs_to :user

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end

  def user_name
    self.user ? self.user.name : nil
  end
end
