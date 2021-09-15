class LocationHistory < ApplicationRecord
  belongs_to :user

  scope :by_start_time, ->(start_time) { where('created_at >= ?', start_time) if start_time }
  scope :by_end_time, ->(end_time) { where('created_at <= ?', end_time) if end_time }
  scope :by_radius, ->(radius) { where('radius <= ?', radius) if radius }
end
