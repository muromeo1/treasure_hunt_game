module Destinations
  class CheckDistance
    include Interactor
    include BaseInteractor

    requires :current_location, :email, :user

    def call
      save_history
      check_arrival
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

    def save_history
      context.history = user.location_histories.create!(
        current_location: current_location,
        destination: TreasureHunt::LOCATION,
        radius: distance.in_meters
      )
    end

    def check_arrival
      return unless near_from_destination?

      send_congratulations_email
      user.found_the_treasure
    end

    def near_from_destination?
      distance.in_meters <= 5
    end

    def send_congratulations_email
      'email' unless user.treasure_found
    end

    def return_distance
      context.distance = distance.in_meters
    end
  end
end
