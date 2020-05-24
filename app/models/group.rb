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
class Group < ApplicationRecord
  belongs_to :activity, inverse_of: :groups

  has_many :spots, -> { order(:position) }, inverse_of: :group, dependent: :destroy

  validates :name, presence: true

  acts_as_list scope: :activity
end
