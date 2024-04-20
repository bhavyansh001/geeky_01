require 'rails_helper'

RSpec.describe Article, type: :model do
  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  context "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_rich_text(:body) }
  end
end
