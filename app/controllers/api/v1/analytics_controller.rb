module Api
  module V1
    class AnalyticsController < ApplicationController
      def analytics
        result = Analytics::GetRequests.call(analytics_params)

        if result.success?
          render_json(status: 'ok', requests: result.requests)
        else
          render_json(status: 'error', description: result.error)
        end
      end

      private

      def analytics_params
        params.permit(:end_time, :radius, start_time: [])
      end
    end
  end
end
