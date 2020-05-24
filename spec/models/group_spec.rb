require "rails_helper"

RSpec.describe Group, type: :model do
  it { is_expected.to belong_to(:activity).inverse_of(:groups) }

  it { is_expected.to have_many(:spots).order(:position).inverse_of(:group).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }

  describe "spots" do
    let(:group) { create(:group) }
    let(:spot_with_position_1) { create(:spot, group: group, position: 1) }
    let(:spot_with_position_2) { create(:spot, group: group, position: 2) }

    it "returns spots sort by position" do
      spot_with_position_1
      spot_with_position_2
      expect(group.spots).to eq([spot_with_position_1, spot_with_position_2])
    end

    it "returns spots sort by position (reversed order)" do
      spot_with_position_2
      spot_with_position_1
      expect(group.spots).to eq([spot_with_position_1, spot_with_position_2])
    end

    it "would be destroyed when the group is destroyed" do
      spot_with_position_1
      spot_with_position_2
      expect { group.destroy }.to change(Spot, :count).by(-2)
    end
  end
end
