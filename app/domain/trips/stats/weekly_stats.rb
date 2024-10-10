module Trips
  module Stats
    class WeeklyStats < ActiveModelSerializers::Model
      def total_distance
        trips.sum(&:distance)
      end

      def total_price
        trips.sum(&:price)
      end

      private

      def trips
        @_trips ||= Trip.where(date: Date.current.all_week)
      end
    end
  end
end
