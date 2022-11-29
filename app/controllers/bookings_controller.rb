class BookingsController < ApplicationController
  before_action :set_flight, only: :new

  def new
    @booking = Booking.new
    number_of_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash.notice = 'Flight successfully booked! A confirmation email has been sent to each passenger!'
      PassengerMailer.with(booking_id: @booking.id).thank_you.deliver_now
      redirect_to @booking
    else
      flash.now[:alert] = ''
      if @booking.errors[:'passengers.name'].include?("can't be blank") ||
        @booking.errors[:'passengers.email'].include?("can't be blank")
        flash.now[:alert] << 'The highlighted fields connot be left blank.'
      end
      @flight = Flight.find(params[:booking][:flight_id])
      render :new, status: 422
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking
      render :show
    else
      flash[:alert] = 'Sorry, the booking does not exist.'
      redirect_to root_url
    end
  end

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def number_of_tickets
    @number_of_tickets = params[:tickets_num].to_i
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
