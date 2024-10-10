require 'rails_helper'

RSpec.describe Trips::Stats::MonthlyDailyStatsList do
  describe '#to_a' do
    context 'when there are trips from current month' do
      let(:first_day_of_month) { Date.current.beginning_of_month }
      let(:last_day_of_month) { Date.current.end_of_month }
      let!(:first_day_trips) { create_list(:trip, 2, date: first_day_of_month, distance: 123) }
      let!(:last_day_trips) { create_list(:trip, 3, date: last_day_of_month, distance: 246) }
      let!(:other_month_trips) do
        create_list(
          :trip,
          2,
          date: Date.current.beginning_of_month - 1.minute,
          distance: 456
        )
      end

      it 'returns daily stats list of trips from current month groupped by day' do
        daily_stats_list = described_class.new.to_a

        expect(daily_stats_list.size).to eq(2)
        expect(daily_stats_list.first.date).to eq(first_day_of_month)
        expect(daily_stats_list.first.total_distance).to eq(246)
        expect(daily_stats_list.last.date).to eq(last_day_of_month)
        expect(daily_stats_list.last.total_distance).to eq(738)
      end
    end

    context 'when there are no trips from current month' do
      let!(:other_month_trips) do
        create_list(
          :trip,
          2,
          date: Date.current.beginning_of_month - 1.minute,
          distance: 456
        )
      end

      it 'returns empty daily stats list' do
        daily_stats_list = described_class.new.to_a

        expect(daily_stats_list).to be_empty
      end
    end
  end
end
