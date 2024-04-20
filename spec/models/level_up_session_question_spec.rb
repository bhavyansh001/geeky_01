require 'rails_helper'

RSpec.describe PracticeArea::LevelUpSessionQuestion, type: :model do
  context "Associations" do
    it { should belong_to(:level_up_session).class_name('PracticeArea::LevelUpSession') }
    it { should belong_to(:question).class_name('PracticeArea::Question') }
  end
end
