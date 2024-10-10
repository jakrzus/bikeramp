module Trips
  class Distance
    def initialize(trip)
      @trip = trip
    end

    def to_m
      raise RouteNotFoundError if api_response["status"] != "OK"

      route = api_response["routes"]&.first || {}
      leg = route["legs"]&.first || {}

      leg.dig("distance", "value") || raise(RouteNotFoundError)
    end

    private

    def api_response
      raise StartAddressMissingError unless @trip.start_address
      raise DestinationAddressMissingError unless @trip.destination_address

      @_api_response ||=
        GoogleMaps::Api::Directions
          .new(@trip.start_address, @trip.destination_address)
          .get
    end

    class StartAddressMissingError < StandardError
      def message
        "Start address is missing"
      end
    end
    class DestinationAddressMissingError < StandardError
      def message
        "Destination address is missing"
      end
    end

    class RouteNotFoundError < StandardError
      def message
        "Route not found, please check the addressess"
      end
    end
  end
end
