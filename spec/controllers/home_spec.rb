require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "returns a 200 OK status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template(:about)
    end

    it "returns a 200 OK status code" do
      get :about
      expect(response).to have_http_status(200)
    end
  end
end
