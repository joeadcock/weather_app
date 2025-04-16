module OpenWeatherMap
  class Forecast < Api
    API_BASE = "http://api.openweathermap.org/data/2.5"

    def self.daily(lat, lon, units = "imperial")
      resp = Faraday.get("#{API_BASE}/forecast/daily?cnt=#{cnt}&lat=#{lat}&lon=#{lon}&appid=#{appid}&units=#{units}")
      if resp.status == 200
        JSON.parse(resp.body)
      else
        # TODO: handle errors
      end
    end

    # def self.forecast(lat, lon)
    #   resp = Faraday.get("#{API_BASE}/forecast?lat=#{lat}&lon=#{lon}&units=#{units}&appid=#{appid}")

    #   if resp.status == 200
    #     JSON.parse(resp.body)
    #   else
    #     # TODO: handle errors
    #   end
    # end

    private

    def self.cnt
      6
    end
  end
end
