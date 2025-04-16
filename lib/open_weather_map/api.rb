module OpenWeatherMap
  class Api
    private

    def self.appid
      ENV.fetch("OPENWEATHERMAP_API_KEY")
    end
  end
end
