# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint           not null
#
# Indexes
#
#  index_groups_on_activity_id  (activity_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#
FactoryBot.define do
  factory :group do
    activity
    name { Faker::Lorem.words(number: rand(1..4), supplemental: true).join(" ").capitalize }
  end
end
