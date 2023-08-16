class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :appointment_type
      t.date :appointment_date
      t.time :appointment_time
      t.timestamps
    end
  end
end
