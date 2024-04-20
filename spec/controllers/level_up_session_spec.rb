require 'rails_helper'

RSpec.describe LevelUpSessionController, type: :controller do
  let(:user) { create(:user) }
  let(:level_up_session) { create(:practice_area_level_up_session, user: user) }
  let(:question_params) { { expression: "3+4", solution: "7", time_taken: 10 } }

  before do
    sign_in user
  end

  describe "GET #question" do
    it "assigns random numbers and an operator" do
      get :question
      expect(assigns(:num1)).not_to be_nil
      expect(assigns(:num2)).not_to be_nil
      expect(assigns(:operator)).to match(/[\+\-\*\/]/)
    end

    it "renders the question template" do
      get :question
      expect(response).to render_template(:question)
    end
  end

  describe "POST #create" do
    it "creates a new question" do
      expect {
        post :create, params: { expression: "3+4", solution: "7", time_taken: 10 }
      }.to change(PracticeArea::Question, :count).by(1)
    end

    it "redirects to the question action" do
      post :create, params: { expression: "3+4", solution: "7", time_taken: 10 }
      expect(response).to redirect_to(question_path)
    end
  end
end
