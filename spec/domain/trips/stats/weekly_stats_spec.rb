require 'rails_helper'

RSpec.describe Trips::Stats::WeeklyStats do
  describe '#total_distance' do
    context 'when there are trips from current week and other weeks' do
      let!(:current_week_trips) { create_list(:trip, 3, date: Date.current, distance: 123) }
      let!(:other_week_trips) do
        create_list(
          :trip,
          2,
          date: Date.current.beginning_of_week - 1.minute,
          distance: 456
        )
      end

      it 'returns total distance of trips from current week' do
        expect(described_class.new.total_distance).to eq(369)
      end
    end

    context 'when there are no trips from current week' do
      let!(:other_week_trips) do
        create_list(
          :trip,
          2,
          date: Date.current.beginning_of_week - 1.minute,
          distance: 456
        )
      end

      it 'returns 0' do
        expect(described_class.new.total_distance).to eq(0)
      end
    end
  end

  describe '#total_price' do
    context 'when there are trips from current week and other weeks' do
      let!(:current_week_trips) { create_list(:trip, 3, date: Date.current, price: 9.99) }
      let!(:other_week_trips) do
        create_list(
          :trip,
          2,
          date: Date.current.beginning_of_week - 1.minute,
          price: 19.99
        )
      end

      it 'returns total price of trips from current week' do
        expect(described_class.new.total_price).to eq(29.97)
      end
    end

    context 'when there are no trips from current week' do
      let!(:other_week_trips) { create_list(:trip, 2, date: Date.current.beginning_of_week - 1.minute, price: 19.99) }

      it 'returns 0' do
        expect(described_class.new.total_price).to eq(0)
      end
    end
  end
end
