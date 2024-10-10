module Trips
  module Stats
    class WeeklyStatsSerializer < ApplicationSerializer
      attributes :total_distance, :total_price

      def total_distance
        meters_to_formatted_kilometers(object.total_distance)
      end

      def total_price
        formatted_price(object.total_price)
      end
    end
  end
end
