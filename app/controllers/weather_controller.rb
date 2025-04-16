class WeatherController < ApplicationController
  before_action :set_address
  before_action :set_units

  def show
    @weather = WeatherService.perform(@address, @units) if @address.valid?
    @title = "#{@weather&.zip || "Local"} Weather"
  end

  private

  def address_params
    params.permit(:country, :zip)
  end

  def set_address
    @address = Address.new(address_params)
  end

  def set_units
    @units = params.fetch(:units, "imperial")
  end
end
