class WeatherService
  def self.perform(address, units = "imperial")
    forecast(address.zip, address.country, units)
  end

  private

  def self.cache_key(zip, country, units)
    "weather:#{Rails.env}:#{country}-#{zip}-#{units}"
  end

  def self.forecast(zip, country, units)
    cached = true

    forecast_params =
      Rails.cache.fetch("#{cache_key(zip, country, units)}/forecast-test",
                        expired_in: 30.minutes) do
        cached = false
        _forecast(zip, country, units)
      end

    Forecast.new(forecast_params.merge(cached:, units:))
  end

  def self._forecast(zip, country, units)
    geocode = OpenWeatherMap::Geocoding.zip(zip, country)
    latitude = geocode["lat"]
    longitude = geocode["lon"]

    current_weather = OpenWeatherMap::Weather.weather(latitude,
                                                      longitude,
                                                      units)
    forecast = OpenWeatherMap::Forecast.daily(latitude, longitude, units)

    todays_forecast = forecast["list"].shift

    {
      icon: icon_url(current_weather["weather"].first["icon"]),
      temperature: current_weather["main"]["temp"],
      temperature_min: todays_forecast["temp"]["min"],
      temperature_max: todays_forecast["temp"]["max"],
      zip:,
      daily: daily_list(forecast)
    }
  end

  def self.icon_url(code)
    "https://openweathermap.org/img/wn/#{code}@2x.png"
  end

  def self.daily_list(forecast)
    forecast["list"].map do |daily|
      {
        day: Time.at(daily["dt"]).strftime("%a"),
        temperature_min: daily["temp"]["min"],
        temperature_max: daily["temp"]["max"],
        icon: icon_url(daily["weather"].first["icon"])
      }
    end
  end
end
