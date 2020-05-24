FactoryBot.define do
  factory :spot do
    group
    name { Faker::Lorem.words(number: rand(1..4), supplemental: true).join(" ").capitalize }
    latitude { rand(20.2531..45.3135) }
    longitude { rand(122.5557..153.5911) }
  end
end
