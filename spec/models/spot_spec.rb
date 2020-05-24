require "rails_helper"

RSpec.describe Spot, type: :model do
  it { is_expected.to belong_to(:group).inverse_of(:spots) }

  it { is_expected.to have_many(:logs).order(created_at: :desc).inverse_of(:spot).dependent(:destroy) }

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

  describe "logs" do
    let(:spot) { create(:spot) }
    let!(:log_1) { create(:log, spot: spot) }
    let!(:log_2) { create(:log, spot: spot) }

    it "returns spots sort by created_at" do
      log_1.update(title: "New title")
      expect(spot.logs).to eq([log_2, log_1])
    end

    it "would be destroyed when the spot is destroyed" do
      expect { spot.destroy }.to change(Log, :count).by(-2)
    end
  end
end
