FactoryBot.define do
  factory :group do
    activity
    name { Faker::Lorem.words(number: rand(1..4), supplemental: true).join(" ").capitalize }
  end
end
