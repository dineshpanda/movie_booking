class Coupon < ActiveRecord::Base

  #associations
  has_many :bookings

  #validations
  with_options presence: true do
    validates :code, uniqueness: { case_sensitive: false }
    validates :amount
  end

  #callbacks
  before_save :downcase_code

  def downcase_code
    code.downcase!
  end
  
end
