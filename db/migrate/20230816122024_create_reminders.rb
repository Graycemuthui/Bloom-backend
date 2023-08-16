class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.date :reminder_date

      t.timestamps
    end
  end
end
