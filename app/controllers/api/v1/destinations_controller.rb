module Api
  module V1
    class DestinationsController < ApplicationController
      def check_arrival
        byebug
      end

      private

      def destinations_params
        params.permit(:email, current_location: [])
      end
    end
  end
end
