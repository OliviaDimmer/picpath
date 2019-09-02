class User < ApplicationRecord
  validates :name, :phone_number, :email, presence: true
  has_many :shoots
end
