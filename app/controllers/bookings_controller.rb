class BookingsController < ApplicationController

  include BookingsHelper
  before_action :authenticate_user!
  
  def index
    @bookings = current_user.bookings
  end
  
  def create
    booking = Booking.new(booking_params)
    booking.booking_at =  booking.booking_at.change(hour: booking_params.fetch(:booking_at, 0))
    booking.coupon_id = Coupon.find_by_code(booking_params.fetch(:coupon_code)).try(:id)
    booking.amount = booking.payable_amount
    if booking.save
      flash[:success] = t('booking.success')
    else
      flash[:alert] = booking.errors.full_messages.first
    end
    redirect_to root_path
  end

  def destroy
    booking = Booking.find_by_id(params[:id])
    booking.destroy ? flash[:success] = t('booking.cancel_success') : flash[:alert] = t('booking.cancel_failure')
    redirect_to bookings_path
  end

  def validate_coupon
    @movie = Movie.find_by_id(params[:movie_id])
    @coupon = Coupon.find_by_code(params[:coupon_code].downcase)
  end

  private

  def booking_params
    params.require(:booking).permit(:theater_id, :movie_id, :booking_booking_at_1, :booking_booking_at_2i, :booking_booking_at_3i, :booking_at, :coupon_code).merge(user_id: current_user.id)
  end
  
end
