require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'requires an email' do
      user = User.new(password: 'password')
      expect(user.valid?).to be(false)
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'requires a password' do
      user = User.new(email: 'test@example.com')
      expect(user.valid?).to be(false)
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'requires a minimum password length of 6 characters' do
      user = User.new(email: 'test@example.com', password: '12345')
      expect(user.valid?).to be(false)
      expect(user.errors[:password])
      .to include('is too short (minimum is 6 characters)')
    end

    it 'requires the password and password confirmation to match' do
      user = User.new(email: 'test@example.com',
                      password: 'password',
                      password_confirmation: 'wrong_password')
      expect(user.valid?).to be(false)
      expect(user.errors[:password_confirmation])
      .to include("doesn't match Password")
    end
  end
  context 'associations' do
      it {should have_many(:articles)}
      it {should have_many(:comments)}
      it {should have_many(:level_up_sessions).class_name('PracticeArea::LevelUpSession')}
      it "has many level up sessions" do
        user = User.new(email: 'test@example.com', password: "password")
        question = Question.new(user: user)
        level_up_session = LevelUpSession.new(question: question)
        expect(question.level_up_sessions).to include(level_up_session)
      end
      it {should have_many(:participants)}
      it {should have_many(:rooms)}

  end
  context 'methods' do
    describe '#username' do
      it 'returns the capitalized username extracted from the email' do
        user = User.new(email: 'test@example.com')
        expect(user.username).to eq 'Test'
      end
    end

    describe '#avg_time_taken' do
      it 'returns the average time taken rounded to one decimal place' do
        user = User.create
        Question.create(user: user, time_taken: 10)
        Question.create(user: user, time_taken: 15)
        Question.create(user: user, time_taken: 20)
        expect(user.avg_time_taken).to eq 15.0
      end
      it 'returns nil if no questions are associated with the user' do
        user = User.create
        expect(user.avg_time_taken).to be_nil
      end
    end
  
    describe '#best_time_taken' do
      it 'returns the minimum time taken from associated questions' do
        user = User.create
        Question.create(user: user, time_taken: 10)
        Question.create(user: user, time_taken: 15)
        Question.create(user: user, time_taken: 20)
        expect(user.best_time_taken).to eq 10
      end
      it 'returns nil if no questions are associated with the user' do
        user = User.create
        expect(user.best_time_taken).to be_nil
      end
    end
  
    describe '#accuracy' do
      it 'returns the accuracy percentage based on correct and total questions' do
        user = User.create
        Question.create(user: user, is_correct: true)
        Question.create(user: user, is_correct: true)
        Question.create(user: user, is_correct: false)
        Question.create(user: user, is_correct: false)
        expect(user.accuracy).to eq 50
      end
      it 'returns nil if no questions are associated with the user' do
        user = User.create
        expect(user.accuracy).to be_nil
      end
    end
  end
end
