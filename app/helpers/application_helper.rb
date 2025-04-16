module ApplicationHelper
  def temp_units(temperature, units)
    unit = units == "metric" ? "℃" : "℉"

    "#{temperature.round}#{unit}"
  end
end
