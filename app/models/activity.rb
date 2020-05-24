class Activity < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  acts_as_list scope: :user
end
