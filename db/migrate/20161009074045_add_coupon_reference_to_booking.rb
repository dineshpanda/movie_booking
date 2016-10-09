class AddCouponReferenceToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :coupon, index: true, foreign_key: true
  end
end
