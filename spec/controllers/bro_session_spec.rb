require 'rails_helper'

RSpec.describe BroSessionController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:participant) { create(:participant, user: user, room: room) }

  before { sign_in user }

  describe "GET #index" do
    it "responds successfully" do
      get :index, params: { room_id: room.id }
      expect(response).to have_http_status(200)
    end

    it "assigns @expression, @num1, @num2 and @@is_correct" do
      get :index, params: { room_id: room.id }
      expect(assigns(:expression)).not_to be_nil
      expect(assigns(:num1)).not_to be_nil
      expect(assigns(:num2)).not_to be_nil
    end
  end

  describe "POST #create" do
  let(:valid_params) { { room_id: room.id, expression: "3+4", solution: "7", time_taken: "30" } }

  before do
    allow(controller).to receive(:set_bro_session)
  end

  context "with valid parameters" do
      it "redirects to room_bro_session_index_path" do
      post :create, params: valid_params
      expect(response).to redirect_to(room_bro_session_index_path(room))
    end

    it "calls set_bro_session method" do
      expect(controller).to receive(:set_bro_session)
      post :create, params: valid_params
    end
  end
end


  describe "GET #dashboard" do
    before { participant }

    it "responds successfully" do
      get :dashboard, params: { room_id: room.id }
      expect(response).to have_http_status(200)
    end

    it "assigns @participants" do
      get :dashboard, params: { room_id: room.id }
      expect(assigns(:participants)).to eq([user])
    end

    it "assigns @questionsU" do
      question = create(:practice_area_question, user_id: user.id)
      create(:bro_session, question: question, room_id: room.id)
      get :dashboard, params: { room_id: room.id }
      expect(assigns(:questionsU)[user.id]).to eq([question])
    end
  end
end
