FactoryBot.define do
  factory :discount do
    name { Faker::Games::Pokemon.name }
    percentage { Faker::Number.between(from: 0.0, to: 1.0) }
    minimum_quantity { Faker::Number.number(digits: 2) }
    #association :merchant
  end
end
