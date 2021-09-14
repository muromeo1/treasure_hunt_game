module Destinations
  class CheckDistance
    include Interactor
    include BaseInteractor

    requires :current_location, :email

    def call
      send_congratulations_message if near_from_destination?
      return_distance
    rescue StandardError => error
      context.fail!(error: error.message)
    end

    private

    def distance
      @distance ||= DistanceCalculator.new(
        current_location: current_location,
        destination: TreasureHunt::LOCATION
      )
    end

    def near_from_destination?
      distance.in_meters <= 5
    end

    def send_congratulations_message
      'email'
    end

    def return_distance
      context.distance = distance.in_meters
    end
  end
end
