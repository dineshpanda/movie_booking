module BookingsHelper

  def booking_datetime(booking)
    booking.booking_at.strftime("%I %p, %d %b, %Y")
  end
  
end
