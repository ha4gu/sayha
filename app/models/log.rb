class Log < ApplicationRecord
  belongs_to :spot, inverse_of: :logs

  validates :title, presence: true
  validates :body, presence: true
end
