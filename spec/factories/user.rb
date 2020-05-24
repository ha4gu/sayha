FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: "example") }
    password { Faker::Internet.password(min_length: 16, max_length: 32, mix_case: true) }
  end
end
