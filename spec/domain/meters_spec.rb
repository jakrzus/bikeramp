require 'rails_helper'

RSpec.describe Meters do
  describe '#to_km' do
    context 'with 0 meters' do
      it 'returns 0 km' do
        expect(described_class.new(0).to_km).to eq(0)
      end
    end

    context 'with 1000 meters' do
      it 'returns 1 km' do
        expect(described_class.new(1000).to_km).to eq(1)
      end
    end

    context 'with 1234 meters' do
      it 'returns 1.23 km' do
        expect(described_class.new(1234).to_km).to eq(1.23)
      end
    end

    context 'with nil' do
      it 'returns 0 km' do
        expect(described_class.new(nil).to_km).to eq(0)
      end
    end
  end
end
