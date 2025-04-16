FactoryBot.define do
  factory :address do
    city { "Brooklyn" }
    country { "US" }
    state { "NY" }
    zip { "11222" }
  end
end
