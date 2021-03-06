class Booking < ActiveRecord::Base

  attr_accessor :coupon_code
  
  #max seat in a theater
  MAX_SEAT = 100

  #sort all the bookings in desc order of their booking_at time
  default_scope -> { order(booking_at: :desc) } 
    
  #associations
  belongs_to :user
  belongs_to :movie
  belongs_to :theater
  belongs_to :coupon

  #validations
  validates :booking_at, :user, :movie, :theater, :amount, presence: true
  validate :availability, on: :create
  
  def payable_amount
    coupon_discount = coupon.present? ? coupon.amount : 0
    movie.ticket_fee_with_discount(self.user) - coupon_discount
  end
  
  def cancellable?
    booking_at > Time.current
  end

  private
  
  def availability
    errors[:base] << I18n.t('booking.sold_out') if self.class.where(booking_at: booking_at, theater: theater, movie: movie).count >= MAX_SEAT
    errors[:base] << I18n.t('booking.past_date') if booking_at < Time.current
  end

end
