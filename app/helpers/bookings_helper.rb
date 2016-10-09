module BookingsHelper

  def booking_datetime(booking)
    booking.booking_at.strftime("%I %p, %d %b, %Y")
  end

  def coupon_status(booking)
    coupon ||= booking.coupon
    coupon ? "#{coupon.amount.round(2)} discount using #{coupon.code}" : "Not applied"
  end
  
end
