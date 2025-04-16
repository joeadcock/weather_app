class Address
  include ActiveModel::Model
  include ActiveModel::Attributes


  attribute :city, :string # not currently used
  attribute :state, :string # not currently used
  attribute :zip, :string
  attribute :country, :string, default: "US"

  validates :zip, presence: true
end
