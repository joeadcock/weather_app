require 'webmock'

module WebmockHelper
  def self.stub_open_weather_map
    stub_open_weather_map_forecast
    stub_open_weather_map_geo_zip
    stub_open_weather_map_weather
  end

  def self.stub_open_weather_map_forecast
    WebMock
      .stub_request(:get, "http://api.openweathermap.org/data/2.5/forecast/daily?appid=00000000000000000000000000000000&cnt=6&lat=40.7272&lon=-73.9498&units=imperial")
      .to_return(status: 200,
                 body: file_fixture("api.openweathermap.org--data--2.5--daily-imperial.json").read,
                 headers: {})
    WebMock
      .stub_request(:get, "http://api.openweathermap.org/data/2.5/forecast/daily?appid=00000000000000000000000000000000&cnt=6&lat=40.7272&lon=-73.9498&units=metric")
      .to_return(status: 200,
                body: file_fixture("api.openweathermap.org--data--2.5--daily-metric.json").read,
                headers: {})
  end

  def self.stub_open_weather_map_geo_zip
    WebMock
      .stub_request(:get, "http://api.openweathermap.org/geo/1.0/zip?appid=00000000000000000000000000000000&zip=11222,US")
      .to_return(status: 200,
                 body: file_fixture('api.openweathermap.org--geo--1.0--zip.json').read,
                 headers: {})
  end

  def self.stub_open_weather_map_weather
    WebMock
      .stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?appid=00000000000000000000000000000000&lat=40.7272&lon=-73.9498&units=imperial")
      .to_return(status: 200,
                 body: file_fixture("api.openweathermap.org--data--2.5--weather-imperial.json").read,
                 headers: {})

    WebMock
      .stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?appid=00000000000000000000000000000000&lat=40.7272&lon=-73.9498&units=metric")
      .to_return(status: 200,
                 body: file_fixture("api.openweathermap.org--data--2.5--weather-metric.json").read,
                 headers: {})
  end

  def self.file_fixture(filename)
    File.new "spec/fixtures/files/#{filename}"
  end
end
