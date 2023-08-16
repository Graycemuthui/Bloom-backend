class Facility < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :appointments, foreign_key: :facility_id, dependent: :destroy
end
