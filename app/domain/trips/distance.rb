module Trips
  class Distance
    def initialize(trip)
      @trip = trip
    end

    def to_m
      route = api_response["routes"]&.first || {}
      leg = route["legs"]&.first || {}

      leg.dig("distance", "value")
    end

    private

    def api_response
      raise "No start address" unless @trip.start_address
      raise "No destination address" unless @trip.destination_address

      @_api_response ||=
        GoogleMaps::Api::Directions
          .new(@trip.start_address, @trip.destination_address)
          .get
    end
  end
end
