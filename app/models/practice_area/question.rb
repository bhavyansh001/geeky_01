module PracticeArea
  class Question < ApplicationRecord
      validates :solution, presence: true
      has_many :level_up_session_questions, 
      class_name: 'PracticeArea::LevelUpSessionQuestion'
      has_many :level_up_sessions, through: :level_up_session_questions, 
      class_name: 'PracticeArea::LevelUpSessionQuestion'
      has_many :users, through: :level_up_sessions, 
      class_name: 'PracticeArea::LevelUpSession'
  end
end

