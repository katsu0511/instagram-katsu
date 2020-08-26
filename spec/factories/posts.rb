FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 140) }
  end
end
