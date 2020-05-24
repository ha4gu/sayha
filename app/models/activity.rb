# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_activities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Activity < ApplicationRecord
  belongs_to :user, inverse_of: :activities

  has_many :groups, -> { order(:position) }, inverse_of: :activity, dependent: :destroy

  validates :name, presence: true

  acts_as_list scope: :user
end
