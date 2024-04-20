require 'rails_helper'

RSpec.describe Room, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
  end
end
