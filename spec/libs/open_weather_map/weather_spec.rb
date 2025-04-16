require "rails_helper"

RSpec.describe OpenWeatherMap::Weather, type: :lib do
  describe '.weather' do
    subject(:weather) { described_class.weather(lat, lon) }

    let(:lat) { 40.7272 }
    let(:lon) { -73.9498 }

    before do
      WebmockHelper.stub_open_weather_map_weather
    end

    it "returns the requested weather" do
      expect(weather["main"]["temp"]).to eq 56.68
    end
  end
end
