FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 140) }
  end
end
