module Analytics
  class GetRequests
    include Interactor
    include BaseInteractor

    delegate :radius, to: :context

    def call
      return_requests
    rescue StandardError => error
      context.fail!(error: error.message)
    end

    private

    def location_histories
      @location_histories ||= LocationHistory.select(:email, :current_location)
                                             .by_start_time(start_time)
                                             .by_end_time(end_time)
                                             .by_radius(radius)
    end

    def start_time
      DateTime.parse(context.start_time.first)
    rescue StandardError
      nil
    end

    def end_time
      DateTime.parse(context.end_time)
    rescue StandardError
      nil
    end

    def return_requests
      context.requests = location_histories&.map do |history|
        {
          email: history.email,
          current_location: history.current_location
        }
      end
    end
  end
end
