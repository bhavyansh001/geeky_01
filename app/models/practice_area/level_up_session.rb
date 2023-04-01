module PracticeArea
  class LevelUpSession < ApplicationRecord
    has_many :questions, class_name: 'PracticeArea::Question'
  end
end
