require 'rails_helper'

RSpec.describe User, type: :model do
  context "Associations" do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
    it { should have_many(:level_up_sessions).class_name('PracticeArea::LevelUpSession') }
    it { should have_many(:questions).class_name('PracticeArea::Question') }
    it { should have_many(:participants) }
    it { should have_many(:rooms) }
  end

  context "Devise Modules" do
    let(:user) { build(:user) }

    it "should include database_authenticatable module" do
      expect(user.devise_modules).to include(:database_authenticatable)
    end

    it "should include registerable module" do
      expect(user.devise_modules).to include(:registerable)
    end

    it "should include recoverable module" do
      expect(user.devise_modules).to include(:recoverable)
    end

    it "should include rememberable module" do
      expect(user.devise_modules).to include(:rememberable)
    end

    it "should include validatable module" do
      expect(user.devise_modules).to include(:validatable)
    end

    it "should not include confirmable module" do
      expect(user.devise_modules).not_to include(:confirmable)
    end
  end

  context "Default attribute values" do
    let(:user) { build(:user) }

    it "should have a default value of false for guest" do
      expect(user.guest).to eq(false)
    end
  end

  context "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6).is_at_most(128) }
  end

  context "Methods" do
    let(:user) { create(:user) }

    it "should return the username based on email" do
      expect(user.username).to eq(user.email.split('@')[0].capitalize)
    end

    it "should return the average time taken for questions" do
      question = create(:practice_area_question, user_id: user.id, time_taken: 10)
      expect(user.avg_time_taken).to eq(10.0)
    end

    it "should return the best time taken for questions" do
      question = create(:practice_area_question, user_id: user.id, time_taken: 5)
      expect(user.best_time_taken).to eq(5)
    end

    it "should return the accuracy for questions" do
      create_list(:practice_area_question, 5, user_id: user.id, is_correct: true)
      create_list(:practice_area_question, 3, user_id: user.id, is_correct: false)
      expect(user.accuracy).to eq(62)
    end
  end
end
