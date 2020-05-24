class Activity < ApplicationRecord
  belongs_to :user, inverse_of: :activities

  has_many :groups, -> { order(:position) }, inverse_of: :activity, dependent: :destroy

  validates :name, presence: true

  acts_as_list scope: :user
end
