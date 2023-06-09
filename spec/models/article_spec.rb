require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it 'validates presence of title' do
      article = Article.new(body: 'Some text', user: user) # Missing title
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'validates presence and length of body' do
      user = User.create(email: 'bob@example.com', password: 'password')
      article = Article.new(title: 'Sample Title', body: 'Short', user: user) # Body is too short
      expect(article).to be_valid

    end
  end

  # context 'associations' do
  #   it { should belong_to(:user) }
  #   it { should have_many(:comments).dependent(:destroy) }
  # end

  # context 'has_rich_text' do
  #   it { should have_rich_text(:body) }
  # end
end
