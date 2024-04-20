require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  describe "Root route" do
    it "routes to home#index" do
      expect(get: "/").to route_to("home#index")
    end
  end

  describe "About route" do
    it "routes to home#about" do
      expect(get: "/home/about").to route_to("home#about")
    end
  end

  describe "Devise routes" do
    it "routes to users/sessions#create for user sessions" do
      expect(post: "/users/sign_in").to route_to("users/sessions#create")
    end

    it "routes to users/sessions#destroy for user sessions" do
      expect(delete: "/users/sign_out").to route_to("users/sessions#destroy")
    end
  end

  describe "Article routes" do
    it "routes to articles#index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to articles#show" do
      expect(get: "/articles/1").to route_to("articles#show", id: "1")
    end

    it "routes to articles#new" do
      expect(get: "/articles/new").to route_to("articles#new")
    end

    it "routes to articles#edit" do
      expect(get: "/articles/1/edit").to route_to("articles#edit", id: "1")
    end

    it "routes to articles#create" do
      expect(post: "/articles").to route_to("articles#create")
    end

    it "routes to articles#update" do
      expect(put: "/articles/1").to route_to("articles#update", id: "1")
    end

    it "routes to articles#destroy" do
      expect(delete: "/articles/1").to route_to("articles#destroy", id: "1")
    end

    it "routes to comments#create" do
      expect(post: "/articles/1/comments").to route_to("comments#create", article_id: "1")
    end
  end

  describe "Practice area routes" do
    it "routes to practice_area#index" do
      expect(get: "/practice").to route_to("practice_area#index")
    end

    it "routes to practice_area#bro_vs_pro" do
      expect(get: "/bro_vs_pro").to route_to("practice_area#bro_vs_pro")
    end

    it "routes to practice_area#bro_vs_bro" do
      expect(get: "/bro_vs_bro").to route_to("practice_area#bro_vs_bro")
    end

    it "routes to practice_area#level_up" do
      expect(get: "/level_up").to route_to("practice_area#level_up")
    end

    it "routes to level_up_session#create" do
      expect(post: "/level_up").to route_to("level_up_session#create")
    end

    it "routes to level_up_session#question" do
      expect(get: "/question").to route_to("level_up_session#question")
    end

    it "routes to level_up_session#time_up" do
      expect(get: "/time_up").to route_to("level_up_session#time_up")
    end
  end

  describe "Room routes" do
    it "routes to rooms#create" do
      expect(post: "/rooms").to route_to("rooms#create")
    end

    it "routes to rooms#show" do
      expect(get: "/rooms/1").to route_to("rooms#show", id: "1")
    end

    it "routes to bro_session#index" do
      expect(get: "/rooms/1/bro_session").to route_to("bro_session#index", room_id: "1")
    end

    it "routes to bro_session#create" do
      expect(post: "/rooms/1/bro_session").to route_to("bro_session#create", room_id: "1")
    end

    it "routes to bro_session#dashboard" do
      expect(get: "/rooms/1/dashboard").to route_to("bro_session#dashboard", room_id: "1")
    end
  end

  describe "Stats routes" do
    it "routes to stats#stats" do
      expect(get: "/profile").to route_to("stats#stats")
    end
  end
end
