class AddFkToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :facility, null: false, foreign_key: true
    add_reference :appointments, :user, null: false, foreign_key: true
  end
end
