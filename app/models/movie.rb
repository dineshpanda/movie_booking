class Movie < ActiveRecord::Base

  #female discount in percentage 5 = 5%
  FEMALE_DISCOUNT = 5
  
  #scopes
  scope :screened, -> { where("release_date <= ?", Date.today).order(release_date: :desc) }

  #validations
  validates :ticket_fee, :title, :release_date , presence: true
  
  #associations
  has_and_belongs_to_many :theaters

  def female_discount(user)
    user.female? ? (ticket_fee * (FEMALE_DISCOUNT.to_f/100)).round(2) : 0
  end

  def ticket_fee_with_discount(user = nil)
    female_discount = 0
    female_discount = female_discount(user) unless user.blank?
    (ticket_fee - female_discount).round(2)
  end
  
end
