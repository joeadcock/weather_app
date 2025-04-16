module OpenWeatherMap
  class Geocoding < Api
    API_BASE = "http://api.openweathermap.org/geo/1.0"

    def self.zip(zip, country)
      resp = Faraday.get("#{API_BASE}/zip?zip=#{zip},#{country}&appid=#{appid}")
      if resp.status == 200
        JSON.parse(resp.body)
      else
        # TODO: handle errors
      end
    end
  end
end
