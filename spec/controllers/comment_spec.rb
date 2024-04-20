require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  before do
    sign_in user
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new comment" do
        expect {
          post :create, params: { article_id: article.id, comment: attributes_for(:comment) }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the article page" do
        post :create, params: { article_id: article.id, comment: attributes_for(:comment) }
        expect(response).to redirect_to(article_path(article))
      end

      it "sets a flash notice" do
        post :create, params: { article_id: article.id, comment: attributes_for(:comment) }
        expect(flash[:notice]).to eq("Comment added")
      end
    end

    context "with invalid parameters" do
      it "does not create a new comment" do
        expect {
          post :create, params: { article_id: article.id, comment: attributes_for(:comment, name: nil) }
        }.not_to change(Comment, :count)
      end

      it "redirects to the article page" do
        post :create, params: { article_id: article.id, comment: attributes_for(:comment, name: nil) }
        expect(response).to redirect_to(article_path(article))
      end

      it "sets a flash notice" do
        post :create, params: { article_id: article.id, comment: attributes_for(:comment, name: nil) }
        expect(flash[:notice]).to eq("Couldn't create comment")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:comment) { create(:comment, article: article) }

    it "deletes the comment" do
      expect {
        delete :destroy, params: { article_id: article.id, id: comment.id }
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the article page" do
      delete :destroy, params: { article_id: article.id, id: comment.id }
      expect(response).to redirect_to(article_path(article))
    end

    it "sets a flash notice" do
      delete :destroy, params: { article_id: article.id, id: comment.id }
      expect(flash[:notice]).to eq("Comment deleted")
    end
  end
end
