require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room, user: user) }

  describe "POST #create" do
    context "when user is authenticated" do
      before { sign_in user }

      it "creates a new room" do
        expect { post :create, params: { name: "Test Room" } }.to change(Room, :count).by(1)
      end

      it "redirects to the new room" do
        post :create, params: { name: "Test Room" }
        expect(response).to redirect_to(room_path(assigns(:room)))
      end

      it "adds the current user as a participant" do
        expect { post :create, params: { name: "Test Room" } }.to change(Participant, :count).by(1)
        expect(Participant.last.user).to eq(user)
      end
    end

    context "when user is not authenticated" do
      it "does not create a new room" do
        expect { post :create, params: { name: "Test Room" } }.not_to change(Room, :count)
      end

      it "redirects to the login page" do
        post :create, params: { name: "Test Room" }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe "GET #show" do
    context "when user is authenticated and is the room creator" do
      before { sign_in user }

      it "assigns the room's creator" do
        get :show, params: { id: room.id }
        expect(assigns(:creator)).to eq(user)
      end

      it "does not add the current user as a participant" do
        get :show, params: { id: room.id }
        expect(Participant.exists?(user: user, room: room)).to be_falsey
      end
    end

    context "when user is authenticated and is not the room creator" do
      let(:other_user) { create(:user) }

      before { sign_in other_user }

      it "adds the current user as a participant" do
        get :show, params: { id: room.id }
        expect(Participant.exists?(user: other_user, room: room)).to be_truthy
      end
    end

    context "when user is not authenticated" do
      it "does not assign the room" do
        get :show, params: { id: room.id }
        expect(assigns(:room)).to be_nil
      end

      it "redirects to the login page" do
        get :show, params: { id: room.id }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
