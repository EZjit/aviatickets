class PassengerMailer < ApplicationMailer
  def thank_you
    @booking = Booking.find(params[:booking_id])
    @url = booking_url(@booking)
    mail(to: @booking.passengers.pluck(:email),
          subject: "Thank tou for booking flight!")
  end
end
