require 'rails_helper'

RSpec.describe "Api::Stats::Weekly", type: :request do
  describe "api/stats/weekly" do
    let!(:current_week_trips) do
      create_list(
        :trip,
        3,
        date: Date.current,
        distance: 123,
        price: 1.23
      )
    end
    it "returns weekly stats" do
      get '/api/stats/weekly'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['total_distance']).to eq("0.37km")
      expect(parsed_response['total_price']).to eq("3.69PLN")
    end
  end
end
