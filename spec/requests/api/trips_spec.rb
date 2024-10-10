require 'rails_helper'

RSpec.describe "Api::Trips", type: :request do
  describe "POST api/trips" do
    let(:distance) { 1234 }
    before do
      allow_any_instance_of(Trips::Distance).to receive(:to_m).and_return(distance)
    end
    context 'with correct params' do
      let(:params) do
        {
          start_address: 'Plac Europejski 2, Warszawa, Polska',
          destination_address: 'Plac Dąbrowskiego 1, Warszawa, Polska',
          price: 9.99,
          date: '2024-10-10'
        }
      end
      it 'creates a new trip and returns 201' do
        expect do
          post '/api/trips', params: params
        end.to change(Trip, :count).by(1)
        expect(response).to have_http_status(:created)
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['start_address']).to eq(params[:start_address])
        expect(parsed_response['destination_address']).to eq(params[:destination_address])
        expect(parsed_response['price']).to eq("9.99")
        expect(parsed_response['date']).to eq("October, 10th")
        expect(parsed_response['distance']).to eq("1.23 km")
      end
    end

    context 'with incorrect params' do
      let(:params) do
        {
          start_address: 'Plac Europejski 2, Warszawa, Polska',
          price: 9.99
        }
      end
      it 'returns 422' do
        expect do
          post '/api/trips', params: params
        end.not_to change(Trip, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with missing destination address' do
      let(:params) do
        {
          start_address: 'Plac Europejski 2, Warszawa, Polska',
          price: 9.99,
          date: '2024-10-10'
        }
      end
      before do
        allow_any_instance_of(Trips::Distance).to receive(:to_m).and_raise(Trips::Distance::DestinationAddressMissingError)
      end
      it 'returns 422' do
        expect do
          post '/api/trips', params: params
        end.not_to change(Trip, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to eq("Destination address is missing")
      end
    end
  end
end
