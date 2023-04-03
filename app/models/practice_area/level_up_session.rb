module PracticeArea
  class LevelUpSession < ApplicationRecord
    has_many :questions, class_name: 'PracticeArea::Question'
    belongs_to :user
  end
end
