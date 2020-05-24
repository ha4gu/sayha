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
class Spot < ApplicationRecord
  belongs_to :group, inverse_of: :spots

  has_many :logs, -> { order(created_at: :desc) }, inverse_of: :spot, dependent: :destroy

  validates :name, presence: true
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  acts_as_list scope: :group
end
