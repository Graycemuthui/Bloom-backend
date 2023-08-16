class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  has_many :reminders, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
