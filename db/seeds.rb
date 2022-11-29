if Rails.env.development?
  Flight.delete_all
  Airport.delete_all
end

airport_names = %w[MSQ MOW LED SVG MEX NBO NRT YYZ GOI GRB MSY MIL BUF BER BUH CCS DRB FKS KHJ LBU OAK]
airport_names.each { |name| Airport.create(name: name) }

400.times do
  airports = Airport.all
  arrival_airport = airports.sample
  departure_airport = airports.sample
  flight_duration = (1200..28800).to_a.sample
  flight_start = (1...10).to_a.sample.days.from_now

  unless arrival_airport == departure_airport
    Flight.create(departure_airport_id: departure_airport.id,
                  arrival_airport_id: arrival_airport.id,
                  flight_start: flight_start,
                  flight_duration: flight_duration)
  end
end