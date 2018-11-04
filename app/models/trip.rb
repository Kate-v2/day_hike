class Trip < ApplicationRecord
  # name
  # start_date
  # end_date

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def distance
    trails.sum(:length)
  end

  def longest_hike
    trails.max_by(&:length)
  end

  def shortest_hike
    trails.min_by(&:length)
  end

  def average_distance
    trails.average(:length).to_f
  end

end
