module PracticeArea
  class Question < ApplicationRecord
      validates :solution, presence: true
      belongs_to :level_up_session, class_name: 'PracticeArea::LevelUpSession'
  end
end
