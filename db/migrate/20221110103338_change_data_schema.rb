class ChangeDataSchema < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :passengers, :bookings
    remove_column :passengers, :booking_id
    create_table :passenger_bookings do |t|
      t.integer :passenger_id
      t.integer :booking_id

      t.timestamps
    end
    add_foreign_key :passenger_bookings, :bookings, column: :booking_id
    add_foreign_key :passenger_bookings, :passengers, column: :passenger_id
  end
end
