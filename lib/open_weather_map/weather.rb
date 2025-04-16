module OpenWeatherMap
  class Weather < Api
    API_BASE = "http://api.openweathermap.org/data/2.5"

    def self.weather(lat, lon, units = "imperial")
      resp = Faraday.get("#{API_BASE}/weather?lat=#{lat}&lon=#{lon}&units=#{units}&appid=#{appid}")
      if resp.status == 200
        JSON.parse(resp.body)
      else
        # TODO: handle errors
      end
    end
  end
end
