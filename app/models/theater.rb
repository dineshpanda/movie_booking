class Theater < ActiveRecord::Base

  #associations
  has_and_belongs_to_many :movies
  
end
