module PracticeArea
  class LevelUpSessionQuestion < ApplicationRecord
    belongs_to :level_up_session, class_name: 'PracticeArea::LevelUpSession'
    belongs_to :question, class_name: 'PracticeArea::Question'
  end
end
