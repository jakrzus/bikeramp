module GoogleMaps
  module Api
    class Directions
      include HTTParty
      base_uri "https://maps.googleapis.com/maps/api/directions/"
      MODE = "bicycling"
      ALTERANTIVES = false
      UNITS = "metric"

      def initialize(origin, destination)
        @origin = origin
        @destination = destination
      end

      def get
        self.class.get(
          "/json",
          query: {
            origin: @origin,
            destination: @destination,
            mode: MODE,
            alternatives: ALTERANTIVES,
            units: UNITS,
            key: ENV.fetch("GOOGLE_MAPS_API_KEY")
          }
        )
      end
    end
  end
end
