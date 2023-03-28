class PracticeArea::Question < ApplicationRecord
    validates :solution, presence: true
    has_many :questions_times
end
