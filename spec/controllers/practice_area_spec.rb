require 'rails_helper'
RSpec.describe PracticeAreaController, type: :controller do
    describe "GET #index" do
      it "responds successfully" do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #level_up" do
      context "when user is authenticated" do
        let(:user) { create(:user) }
        before { sign_in user }

        it "creates a new level up session" do
          expect { get :level_up }.to change { user.level_up_sessions.count }.by(1)
        end
      end

      context "when user is not authenticated" do
        it "returns an unauthorized status" do
          get :level_up
          expect(response).to have_http_status(302)
        end
      end
    end

    describe "GET #bro_vs_pro" do
      it "responds successfully" do
        get :bro_vs_pro
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #bro_vs_bro" do
      it "responds successfully" do
        get :bro_vs_bro
        expect(response).to have_http_status(302)
      end
    end
  end
