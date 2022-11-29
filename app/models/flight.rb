class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :flight_start, presence: true
  validates :flight_duration, presence: true, numericality: { in: 1200..28800 }

  def self.select_flight_dates
    Flight.pluck('flight_start').sort.map { |a| a.strftime('%d.%m.%Y') }.uniq
  end

  def self.search(query)
    if query
      flights = Flight.all.includes(:arrival_airport, :departure_airport).order(:flight_start)
      flights = flights.where(arrival_airport_id: query[:arrival_airport]) unless query[:arrival_airport] == ''
      flights = flights.where(departure_airport_id: query[:departure_airport]) unless query[:departure_airport] == ''
      date = query[:flight_start].to_datetime
      flights = flights.where(flight_start: date.beginning_of_day..date.end_of_day) if date
      flights
    else
      Flight.all.includes(:arrival_airport, :departure_airport).order(:flight_start)
    end
  end
end
