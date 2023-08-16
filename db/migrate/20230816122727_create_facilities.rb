class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :facility_name
      t.string :facility_phone_number
      t.string :facility_location
      t.string :facility_description
      t.string :role, default: 'admin'

      t.timestamps
    end
  end
end
