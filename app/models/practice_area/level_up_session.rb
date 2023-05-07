module PracticeArea
  class LevelUpSession < ApplicationRecord
    belongs_to :user
    has_many :level_up_session_questions, 
    class_name: 'PracticeArea::LevelUpSessionQuestion'
    has_many :questions, through: :level_up_session_questions, 
    class_name: 'PracticeArea::LevelUpSessionQuestion'
  end
end
