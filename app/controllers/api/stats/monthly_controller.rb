module Api
  module Stats
    class MonthlyController < ApiController
      def index
        render json: Trips::Stats::MonthlyDailyStatsList.new.to_a, each_serializer: Trips::Stats::DailyStatsSerializer
      end
    end
  end
end
