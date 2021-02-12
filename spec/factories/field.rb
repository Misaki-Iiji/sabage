FactoryBot.define do
  factory :field do
    name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
