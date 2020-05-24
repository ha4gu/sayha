require "rails_helper"

RSpec.describe Log, type: :model do
  it { is_expected.to belong_to(:spot).inverse_of(:logs) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
end
