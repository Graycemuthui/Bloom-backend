class AddFkToReminders < ActiveRecord::Migration[7.0]
  def change
    add_reference :reminders, :appointment, null: false, foreign_key: true
    add_reference :reminders, :user, null: false, foreign_key: true
  end
end
