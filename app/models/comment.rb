class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_rich_text :body
  validates :name, presence: true
  validates :body, presence: true
end
