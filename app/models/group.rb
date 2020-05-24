class Group < ApplicationRecord
  belongs_to :activity, inverse_of: :groups

  validates :name, presence: true

  acts_as_list scope: :activity
end
