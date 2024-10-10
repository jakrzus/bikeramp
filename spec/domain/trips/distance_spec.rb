
require 'rails_helper'

RSpec.describe Trips::Distance do
  describe '#to_m' do
    let(:trip) { create(:trip) }
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
  end
end
