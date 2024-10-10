module Trips
  module Stats
    class WeeklyStatsSerializer < ApplicationSerializer
      attributes :total_distance, :total_price

      def total_distance
        km = (object.total_distance / 1000.0).round(2)

        "#{km}km"
      end

      def total_price
        number_to_currency(object.total_price, unit: "PLN", precision: 2, format: "%n%u")
      end
    end
  end
end
