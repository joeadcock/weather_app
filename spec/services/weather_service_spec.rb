require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  before { WebmockHelper.stub_open_weather_map }

  describe ".perform" do
    subject(:forecast) { described_class.perform(address) }

    let(:address) { build :address }

    before { WebmockHelper.stub_open_weather_map_forecast }

    it { is_expected.to be_a Forecast }

    it "returns a forecast with the correct values" do
      expect(forecast.temperature).to eq 56.68
      expect(forecast.temperature_min).to eq 50.65
      expect(forecast.temperature_max).to eq 66.25
    end

    context "with metric units" do
      subject(:forecast) { described_class.perform(address, units) }

      let(:units) { "metric" }

      it "returns temperature in C" do
        expect(forecast.units).to eq "metric"
        expect(forecast.temperature).to eq 13.52
      end
    end
  end
end
