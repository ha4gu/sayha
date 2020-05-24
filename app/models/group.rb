class Group < ApplicationRecord
  belongs_to :activity, inverse_of: :groups

  has_many :spots, -> { order(:position) }, inverse_of: :group, dependent: :destroy

  validates :name, presence: true

  acts_as_list scope: :activity
end
