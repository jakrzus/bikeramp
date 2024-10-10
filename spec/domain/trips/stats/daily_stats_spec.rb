require 'rails_helper'

RSpec.describe Trips::Stats::DailyStats do
  describe '#total_distance' do
    context 'when there are trips' do
      let(:trips) { create_list(:trip, 3, distance: 123) }

      it 'returns total distance of trips' do
        expect(described_class.new(Date.current, trips).total_distance).to eq(369)
      end
    end

    context 'when there are no trips' do
      it 'returns 0' do
        expect(described_class.new(Date.current, Trip.none).total_distance).to eq(0)
      end
    end
  end

  describe '#average_distance' do
    context 'when there are trips' do
      let(:trips) { create_list(:trip, 3, distance: 123) }

      it 'returns average distance of trips' do
        expect(described_class.new(Date.current, trips).average_distance).to eq(123)
      end
    end

    context 'when there are no trips' do
      it 'returns 0' do
        expect(described_class.new(Date.current, Trip.none).average_distance).to eq(0)
      end
    end
  end

  describe '#total_price' do
    context 'when there are trips' do
      let(:trips) { create_list(:trip, 3, price: 9.99) }

      it 'returns total price of trips' do
        expect(described_class.new(Date.current, trips).total_price).to eq(29.97)
      end
    end

    context 'when there are no trips' do
      it 'returns 0' do
        expect(described_class.new(Date.current, Trip.none).total_price).to eq(0)
      end
    end
  end

  describe '#average_price' do
    context 'when there are trips' do
      let(:trips) { create_list(:trip, 3, price: 9.99) }

      it 'returns average price of trips' do
        expect(described_class.new(Date.current, trips).average_price).to eq(9.99)
      end
    end

    context 'when there are no trips' do
      it 'returns 0' do
        expect(described_class.new(Date.current, Trip.none).average_price).to eq(0)
      end
    end
  end

  describe '#date' do
    it 'returns date' do
      date = Date.current
      expect(described_class.new(date, Trip.none).date).to eq(date)
    end
  end
end
