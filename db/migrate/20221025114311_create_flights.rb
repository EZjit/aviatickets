class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.datetime :flight_start
      t.interval :flight_duration

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :arrival_airport_id
    add_foreign_key :flights, :airports, column: :departure_airport_id
  end
end
