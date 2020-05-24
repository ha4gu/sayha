require "rails_helper"

RSpec.describe Spot, type: :model do
  it { is_expected.to belong_to(:group).inverse_of(:spots) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }

  it {
    expect(described_class.new).to validate_numericality_of(:latitude)
      .is_greater_than_or_equal_to(-90).is_less_than_or_equal_to(90)
  }

  it {
    expect(described_class.new).to validate_numericality_of(:longitude)
      .is_greater_than_or_equal_to(-180).is_less_than_or_equal_to(180)
  }
end
