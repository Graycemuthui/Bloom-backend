class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :facility, class_name: 'Facility'
  has_many :reminders, dependent: :destroy

  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
end
