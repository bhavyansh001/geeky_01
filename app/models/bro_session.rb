class BroSession < ApplicationRecord
  belongs_to :question, class_name: "PracticeArea::Question"
  belongs_to :participant
end
