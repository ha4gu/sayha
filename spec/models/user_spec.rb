# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:activities).order(:position).inverse_of(:user).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:email) }

  describe "activities" do
    let(:user) { create(:user) }
    let(:act_with_position_1) { create(:activity, user: user, position: 1) }
    let(:act_with_position_2) { create(:activity, user: user, position: 2) }

    it "returns activities sort by position" do
      act_with_position_1
      act_with_position_2
      expect(user.activities).to eq([act_with_position_1, act_with_position_2])
    end

    it "returns activities sort by position (reversed order)" do
      act_with_position_2
      act_with_position_1
      expect(user.activities).to eq([act_with_position_1, act_with_position_2])
    end

    it "would be destroyed when the user is destroyed" do
      act_with_position_1
      act_with_position_2
      expect { user.destroy }.to change(Activity, :count).by(-2)
    end
  end
end
