class Question < ApplicationRecord
    validates :solution, presence: true
end
