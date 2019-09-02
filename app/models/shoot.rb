class Shoot < ApplicationRecord
  validates :slug, :assignment_description, :start, :end, :location, :contact_name, :contact_phone, :deadline, presence: true
  belongs_to :user
end
