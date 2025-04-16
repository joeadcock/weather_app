require "rails_helper"

RSpec.describe OpenWeatherMap::Forecast, type: :lib do
  describe '.daily' do
    subject(:daily) { described_class.daily(lat, lon) }

    let(:lat) { 40.7272 }
    let(:lon) { -73.9498 }

    before do
      WebmockHelper.stub_open_weather_map_forecast
    end

    it "returns the requested forecast" do
      expect(daily["list"][0]["temp"]["min"]).to eq 50.65
    end
  end
end
