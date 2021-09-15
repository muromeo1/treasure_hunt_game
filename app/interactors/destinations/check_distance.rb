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
        email: email,
        current_location: current_location,
        destination: TreasureHunt::LOCATION,
        radius: distance.in_meters
      )
    end

    def send_congratulations_email
      return if user.treasure_found

      user.found_the_treasure

      TreasureHuntMailer.with(
        treasure_location: TreasureHunt::LOCATION,
        nth_found: user.nth_found,
        email: email
      ).congratulations.deliver_now
    end

    def check_arrival
      send_congratulations_email if near_from_destination?
    end

    def near_from_destination?
      distance.in_meters <= 5
    end

    def return_distance
      context.distance = distance.in_meters
    end
  end
end
