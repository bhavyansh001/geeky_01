require 'rails_helper'

RSpec.describe PracticeArea::Question, type: :model do
  context "Associations" do
    it { should have_many(:level_up_session_questions).class_name('PracticeArea::LevelUpSessionQuestion') }
  end

  context "Validations" do
    it { should validate_presence_of(:solution) }
  end
end
