FactoryBot.define do
  factory :forecast do
    cached { false }
    temperature { "76.2" }
  end
end
