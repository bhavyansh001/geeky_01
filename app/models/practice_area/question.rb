class PracticeArea::Question < ApplicationRecord
    validates :solution, presence: true
end
