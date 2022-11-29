class AddForeignKeysToBooking < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookings, :flights, column: :flight_id
    add_foreign_key :bookings, :passengers, column: :passenger_id
  end
end
