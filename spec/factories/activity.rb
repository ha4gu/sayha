FactoryBot.define do
  factory :activity do
    user
    name { Faker::Lorem.words(number: rand(1..4), supplemental: true).join(" ").capitalize }
  end
end
