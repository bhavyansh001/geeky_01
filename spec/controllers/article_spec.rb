require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "assigns @articles" do
      articles = create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to eq(articles)
    end
  end

  describe "GET #new" do
    it "responds successfully" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "assigns @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new article" do
        expect {
          post :create, params: { article: attributes_for(:article) }
        }.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post :create, params: { article: attributes_for(:article) }
        expect(response).to redirect_to(assigns(:article))
      end
    end

    context "with invalid parameters" do
      it "does not create a new article" do
        expect {
          post :create, params: { article: attributes_for(:article, title: nil) }
        }.to_not change(Article, :count)
      end

      it "re-renders the new method" do
        post :create, params: { article: attributes_for(:article, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, params: { id: article.id }
      expect(response).to have_http_status(200)
    end

    it "assigns @comments" do
      comment = create(:comment, article: article)
      get :show, params: { id: article.id }
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #edit" do
    it "responds successfully" do
      get :edit, params: { id: article.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the article" do
        patch :update, params: { id: article.id, article: { title: "New Title" } }
        article.reload
        expect(article.title).to eq("New Title")
      end

      it "redirects to the updated article" do
        patch :update, params: { id: article.id, article: { title: "New Title" } }
        expect(response).to redirect_to(article)
      end
    end

    context "with invalid parameters" do
      it "does not update the article" do
        patch :update, params: { id: article.id, article: { title: nil } }
        article.reload
        expect(article.title).not_to be_nil
      end

      it "re-renders the edit method" do
        patch :update, params: { id: article.id, article: { title: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the article" do
      article
      expect {
        delete :destroy, params: { id: article.id }
      }.to change(Article, :count).by(-1)
    end

    it "redirects to articles_path" do
      delete :destroy, params: { id: article.id }
      expect(response).to redirect_to(articles_path)
    end
  end
end
