class Movie < ActiveRecord::Base

  #scopes
  scope :screened, -> { where("release_date <= ?", Date.today).order(release_date: :desc) }
  
  #associations
  has_and_belongs_to_many :theaters
  
end
