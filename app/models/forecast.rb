class Forecast
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :cached, :boolean
  attribute :description, :string
  attribute :daily # array of hash
  attribute :icon, :string
  attribute :temperature, :float
  attribute :temperature_max, :float
  attribute :temperature_min, :float
  attribute :units, :string
  attribute :zip, :string
end
