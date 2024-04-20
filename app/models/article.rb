class Article < ApplicationRecord
  validates :title, presence: true
  has_rich_text :body
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
