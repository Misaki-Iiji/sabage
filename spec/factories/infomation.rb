FactoryBot.define do
  factory :infomation do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    field
  end
end
