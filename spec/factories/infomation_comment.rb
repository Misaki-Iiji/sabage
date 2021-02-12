FactoryBot.define do
  factory :infomation_comment do
    comment { Faker::Lorem.characters(number: 20) }
    infomation
    user
  end
end
