class PracticeArea::Question < ApplicationRecord
    validates :solution, presence: true
    belongs_to :level_up_session
end
