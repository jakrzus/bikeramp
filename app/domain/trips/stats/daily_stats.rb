module Trips
  module Stats
    class DailyStats < ActiveModelSerializers::Model
      attr_reader :date, :trips

      def initialize(date, trips)
        @date = date
        @trips = trips
      end

      def total_distance
        trips.sum(&:distance)
      end

      def average_distance
        return 0 if trips.size.zero?

        total_distance / trips.size
      end

      def total_price
        trips.sum(&:price)
      end

      def average_price
        return 0 if trips.size.zero?

        total_price / trips.size
      end
    end
  end
end
