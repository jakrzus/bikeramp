require 'rails_helper'

RSpec.describe "Api::Stats::Monthly", type: :request do
  describe "api/stats/monthly" do
    before do
      Timecop.freeze(Date.new(2021, 1, 15))
    end
    let(:first_day_of_month) { Date.new(2021, 1, 1) }
    let(:last_day_of_month) { Date.new(2021, 1, 31) }
    let!(:first_day_trips) do
      create_list(
        :trip,
        3,
        date: first_day_of_month,
        distance: 123,
        price: 1.23
      )
    end
    let!(:last_day_trips) do
      create_list(
        :trip,
        2,
        date: last_day_of_month,
        distance: 246,
        price: 2.46
      )
    end

    it "returns monthly stats" do
      get '/api/stats/monthly'
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)

      expect(parsed_response).to eq(
        [
          {
            "day" => "January, 1st",
            "total_distance" => "0.37km",
            "avg_distance" => "0.12km",
            "avg_price" => "1.23PLN"
          },
          {
            "day" => "January, 31st",
            "total_distance" => "0.49km",
            "avg_distance" => "0.25km",
            "avg_price" => "2.46PLN"
          }
        ]
      )
    end
  end
end
