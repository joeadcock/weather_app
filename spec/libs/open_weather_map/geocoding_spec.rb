require 'rails_helper'

RSpec.describe OpenWeatherMap::Geocoding, type: :lib do
  describe '.zip' do
    subject(:json) { described_class.zip(zip, country) }

    let(:zip) { "11222" }
    let(:country) { "US" }

    before do
      WebmockHelper.stub_open_weather_map_geo_zip
    end

    it "returns the correct Location" do
      expect(json["lat"]).to eq 40.7272
      expect(json["lon"]).to eq -73.9498
    end
  end
end
