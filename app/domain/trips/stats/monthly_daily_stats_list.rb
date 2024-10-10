module Trips
  module Stats
    class MonthlyDailyStatsList
      def to_a
        trips.group_by(&:date).map do |date, trips|
          DailyStats.new(date, trips)
        end
      end

      private

      def trips
        @_trips ||= Trip
          .where(date: Date.current.all_month)
          .order(:date)
      end
    end
  end
end
