FactoryBot.define do
  factory :profile do
    account_name { Faker::Name.name }
  end
end
