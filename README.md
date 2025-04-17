# WeatherApp
WeatherApp is a Ruby on Rails application that displays the current weather conditions and a 5 day forecast based on the address entered by the user. The weather conditions and forecast are provided by the [OpenWeather](https://openweathermap.org/api) API. 

## Features
* Current weather conditions including temperature and today's forecasted high and low
* Five day forecast
* Results are cached based on the zip code for 30 minutes for speed and efficiency

## Technologies Used
* **Ruby on Rails** - web framework
* **RSpec** - automated testing
* **OpenWeatherMap API** - current and forecasted weather and geolocation
* **Google Places API (new)** - user-friendly address completion, parsing address components
* **Stimulus** - javascript framework for managing user interactions on the frontend

## Setup
### Prerequisites
* **OpenWeatherMap API key** You will need to sign up for a free API key from [OpenWeatherMap](https://openweathermap.org/api).
* **Google Cloud API key** [Google Cloud](https://cloud.google.com/) provides a trial period and a credit allowance for new accounts. This app requires that the API key have access to the "Places API (New)" API.
* **Ruby** version 3.2.0 or newer. This project was built and tested with Ruby 3.4.2.
* **Bundler** version 2.6.2.

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/joeadcock/weather_app
   cd weather_app
   ```
2. **Install Dependencies:**
   ```bash
   bundle install
   ```
3. **Configure ENV**
   ```bash
   cp .env.example .env
   cp .env.example .env.test
   ```
   Edit `.env` to include the API keys for both OpenWeatherMap and Google Places
4. **Start the Rails app**
   ```
   bundle exec rails server
   ```

The application can be accessed at http://localhost:3000

## Limitations
The OpenWeatherMap API allows up to 1000 requests/day with their free plan. Multiple API calls are made to generate the full results (geolocation, current weather, forecast).

Google Places address autocompletion lists some results without a zip code. Because the zip code is central to the project requirements, these locations cannot be used in the current version, and will display an error.

## Code structure
* **`app/controllers/weather_controller.rb`:** Handles browser requests, initiates weather service interaction, and rendering the view
* **`app/views/weather/show.html.slim`:** Renders the weather app
* **`app/javascript/controllers/places_autocomplete_controller.js`:** Stimulus Controller that imports and displays Google Place Autocomplete widget, and sends the HTTP request to the backend to retrieve results based on user location selection
* **`app/services/weather_service/`:** Service that retrieves a forecast for an address, and manages the result caching
* **`lib/open_weather_map/geocoding`:** handles interactions with the OpenWeatherMap Geocoding API for determining the latitude and longitude for a ZIP and country code
* **`lib/open_weather_map/weather`:** handles interactions with the OpenWeatherMap Weather API for determining the current weather conditions
* **`lib/open_weather_map/forecast`:** handles interactions with the OpenWeatherMap Forecast API for getting the 5 day forecast, as well as the forcasted high/low temps for the current day
