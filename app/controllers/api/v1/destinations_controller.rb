module Api
  module V1
    class DestinationsController < ApplicationController
      def check_arrival
        result = Destinations::CheckDistance.call(destinations_params)

        if result.success?
          render_json(status: 'ok', distance: result.distance)
        else
          render_json(status: 'error', distance: -1, description: result.error)
        end
      end

      private

      def destinations_params
        new_params = params.permit(:email, current_location: [])
        new_params[:email] ||= current_user.email
        new_params.merge({ user: current_user })
      end
    end
  end
end
