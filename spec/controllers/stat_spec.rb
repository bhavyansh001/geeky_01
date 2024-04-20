require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  let(:user) { create(:user) }
  let(:question1) { create(:practice_area_question, user_id: user.id, expression: "2+3", solution: "5", time_taken: 10, is_correct: true) }
  let(:question2) { create(:practice_area_question, user_id: user.id, expression: "5-3", solution: "2", time_taken: 15, is_correct: true) }
  let(:question3) { create(:practice_area_question, user_id: user.id, expression: "3*4", solution: "12", time_taken: 20, is_correct: true) }
  let(:question4) { create(:practice_area_question, user_id: user.id, expression: "6/3", solution: "2", time_taken: 25, is_correct: true) }

  before { sign_in user }

  describe "GET #stats" do
    it "assigns average time taken for all questions" do
      get :stats
      expect(assigns(:avg_time_taken)).to eq(user.avg_time_taken)
    end

    it "assigns the best time taken for all questions" do
      get :stats
      expect(assigns(:best_time_taken)).to eq(user.best_time_taken)
    end

    it "assigns all user's questions" do
      questions = [question1, question2, question3, question4]
      get :stats
      expect(assigns(:all_questions)).to match_array(questions)
    end

    it "assigns accuracy for all user's questions" do
      get :stats
      expect(assigns(:accuracy)).to eq(user.accuracy)
    end

    it "assigns addition questions" do
      get :stats
      expect(assigns(:addition_questions)).to include(question1)
    end

    it "assigns subtraction questions" do
      get :stats
      expect(assigns(:subtraction_questions)).to include(question2)
    end

    it "assigns multiplication questions" do
      get :stats
      expect(assigns(:multiplication_questions)).to include(question3)
    end

    it "assigns division questions" do
      get :stats
      expect(assigns(:division_questions)).to include(question4)
    end

    it "renders the :stats template" do
      get :stats
      expect(response).to render_template(:stats)
    end
  end
end
