FactoryBot.define do
  factory :order_item do
    quantity { Faker::Number.number(digits: 1) }
  end
end
