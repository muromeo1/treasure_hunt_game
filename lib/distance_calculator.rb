class DistanceCalculator
  attr_reader :current_location, :destination, :distance

  def initialize(current_location:, destination:)
    @current_location = Geokit::LatLng.new(current_location[0], current_location[1])
    @destination      = Geokit::LatLng.new(destination[0], destination[1])
    @distance         = @current_location.distance_to(@destination)
  end

  def in_meters
    (distance * 1609).to_i
  end

  def in_kilometers
    distance * 1.609
  end
end
