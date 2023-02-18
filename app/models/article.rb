class Article < ApplicationRecord
  validates :title, presence: true
  has_rich_text :body
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :user
end
