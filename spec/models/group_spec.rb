require "rails_helper"

RSpec.describe Group, type: :model do
  it { is_expected.to belong_to(:activity).inverse_of(:groups) }

  it { is_expected.to validate_presence_of(:name) }
end
