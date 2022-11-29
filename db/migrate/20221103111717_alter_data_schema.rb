class AlterDataSchema < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :bookings, :passengers
    remove_column :bookings, :passenger_id
    add_column :passengers, :booking_id, :integer
    add_foreign_key :passengers, :bookings, column: :booking_id
  end
end
