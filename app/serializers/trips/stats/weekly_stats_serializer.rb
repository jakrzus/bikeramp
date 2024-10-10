module Trips
  module Stats
    class WeeklyStatsSerializer < ApplicationSerializer
      attributes :total_distance, :total_price

      def total_distance
        meters_to_formatted_kilometers(object.total_distance)
      end

      def total_price
        number_to_currency(object.total_price, unit: "PLN", precision: 2, format: "%n%u")
      end
    end
  end
end
