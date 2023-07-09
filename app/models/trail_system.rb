class TrailSystem < ApplicationRecord
  has_many :trails

  def count_of_trails
    trails.count
  end
end