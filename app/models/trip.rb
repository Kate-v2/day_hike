class Trip < ApplicationRecord
  # name
  # start_date
  # end_date

  has_many :trip_trails
  has_many :trails, through: :trip_trails



end
