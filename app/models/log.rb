# == Schema Information
#
# Table name: logs
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  spot_id    :bigint           not null
#
# Indexes
#
#  index_logs_on_spot_id  (spot_id)
#
# Foreign Keys
#
#  fk_rails_...  (spot_id => spots.id)
#
class Log < ApplicationRecord
  belongs_to :spot, inverse_of: :logs

  validates :title, presence: true
  validates :body, presence: true
end
