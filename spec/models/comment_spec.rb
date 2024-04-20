require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "Associations" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
  end
end
