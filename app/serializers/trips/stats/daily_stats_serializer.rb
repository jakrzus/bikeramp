module Trips
  module Stats
    class DailyStatsSerializer < ApplicationSerializer
      attributes :day, :total_distance, :avg_distance, :avg_price

      def total_distance
        meters_to_formatted_kilometers(object.total_distance)
      end

      def avg_distance
        meters_to_formatted_kilometers(object.average_distance)
      end

      def avg_price
        formatted_price(object.average_price)
      end

      def day
        formatted_date(object.date)
      end
    end
  end
end
