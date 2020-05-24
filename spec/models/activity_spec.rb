require "rails_helper"

RSpec.describe Activity, type: :model do
  it { is_expected.to belong_to(:user).inverse_of(:activities) }
  it { is_expected.to have_many(:groups).order(:position).inverse_of(:activity).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }

  describe "groups" do
    let(:activity) { create(:activity) }
    let(:group_with_position_1) { create(:group, activity: activity, position: 1) }
    let(:group_with_position_2) { create(:group, activity: activity, position: 2) }

    it "returns groups sort by position" do
      group_with_position_1
      group_with_position_2
      expect(activity.groups).to eq([group_with_position_1, group_with_position_2])
    end

    it "returns groups sort by position (reversed order)" do
      group_with_position_2
      group_with_position_1
      expect(activity.groups).to eq([group_with_position_1, group_with_position_2])
    end

    it "would be destroyed when the activity is destroyed" do
      group_with_position_1
      group_with_position_2
      expect { activity.destroy }.to change(Group, :count).by(-2)
    end
  end
end
