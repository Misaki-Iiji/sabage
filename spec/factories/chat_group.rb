FactoryBot.define do
  factory :chat_group do
    chat_group_name { Faker::Lorem.characters(number: 5) }
    chat_group_description { Faker::Lorem.characters(number: 20) }
    user
  end
end
