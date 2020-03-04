class Shoot < ApplicationRecord
  validates :slug, :assignment_description, :start, :end, :location, :contact_name, :contact_phone, :deadline, presence: true
  belongs_to :user, optional: true
  # Callbacks
  after_save :send_assigned_email

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end

  def user_name
    self.user ? self.user.name : nil
  end

  def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.name = auth.info.name
        user.email = auth.info.email
      end
    end

  private

   def send_assigned_email
     if user_assigned_changed?
       ProductMailer.assigned_email(self).deliver_later
     end
   end
 end
