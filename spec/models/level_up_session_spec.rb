require 'rails_helper'

RSpec.describe PracticeArea::LevelUpSession, type: :model do
  context "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:level_up_session_questions).class_name('PracticeArea::LevelUpSessionQuestion') }
  end
end
