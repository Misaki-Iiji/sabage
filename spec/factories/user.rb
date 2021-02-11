FactoryBot.define do
  factory :user do
    nickname { Faker::Lorem.characters(number:5) }
    sequence(:email) { |n| "testuser#{n}@example.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end