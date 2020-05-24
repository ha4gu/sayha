# == Schema Information
#
# Table name: spots
#
#  id         :bigint           not null, primary key
#  latitude   :decimal(10, 7)   not null
#  longitude  :decimal(10, 7)   not null
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint           not null
#
# Indexes
#
#  index_spots_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
FactoryBot.define do
  factory :spot do
    group
    name { Faker::Lorem.words(number: rand(1..4), supplemental: true).join(" ").capitalize }
    latitude { rand(20.2531..45.3135) }
    longitude { rand(122.5557..153.5911) }
  end
end
