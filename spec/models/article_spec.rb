require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'validates presence of title' do
      article = Article.new(title: nil)
      expect(article).to_not be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of body' do
      article = Article.new(body: nil)
      expect(article).to_not be_valid
      expect(article.errors[:body]).to include("can't be blank")
    end

    it 'validates length of body' do
      article = Article.new(body: 'a' * 9)
      expect(article).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end

    # it 'deletes comments when article is deleted' do
    #   article = Article.create!(title: 'Test', body: 'Test body')
    #   comment = Comment.create!(body: 'Test comment', article: article)
    #   expect { article.destroy }.to change { Comment.count }.by(-1)
    # end
  end
end

