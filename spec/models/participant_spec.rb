require 'rails_helper'

RSpec.describe Participant, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:room) }
    it { should have_many(:bro_sessions) }
  end

  context "Callbacks" do
    let(:user) { create(:user) }
    let(:room) { create(:room) }

    it "should call update_users after creation" do
      participant = build(:participant, user: user, room: room)
      allow(participant).to receive(:update_users)

      participant.save

      expect(participant).to have_received(:update_users)
    end
  end
end
