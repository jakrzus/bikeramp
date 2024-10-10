
require 'rails_helper'

RSpec.describe Trips::Distance do
  describe '#to_m' do
    let(:trip) { build(:trip) }
    let(:api_response) { {} }
    let(:api_directions) { instance_double(GoogleMaps::Api::Directions, get: api_response) }
    before do
      allow(GoogleMaps::Api::Directions).to(
         receive(:new)
         .with(trip.start_address, trip.destination_address)
         .and_return(api_directions)
      )
    end

    context 'with correct api response' do
      let(:api_response) do
        JSON.parse(File.read(Rails.root.join('spec/fixtures/get_directions.json')))
      end
      it 'returns distance in meters ' do
        expect(described_class.new(trip).to_m).to eq(2171)
      end
    end

    context 'with incorrect api response' do
      let(:api_response) { {} }

      it 'returns nil' do
        expect(described_class.new(trip).to_m).to be_nil
      end
    end

    context 'when start address is missing' do
      let(:trip) { build(:trip, start_address: nil) }

      it 'raises error' do
        expect { described_class.new(trip).to_m }.to raise_error(Trips::Distance::StartAddressMissingError)
      end
    end

    context 'when destination address is missing' do
      let(:trip) { build(:trip, destination_address: nil) }

      it 'raises error' do
        expect { described_class.new(trip).to_m }.to raise_error(Trips::Distance::DestinationAddressMissingError)
      end
    end
  end
end
