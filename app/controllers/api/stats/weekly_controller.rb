module Api
  module Stats
    class WeeklyController < ApiController
      def show
        render json: Trips::Stats::WeeklyStats.new
      end
    end
  end
end
