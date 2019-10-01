class User < ApplicationRecord
  validates :name, :phone_number, :email, presence: true
  has_many :shoots, dependent: :delete_all

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
