class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments

  has_many :level_up_sessions, 
  class_name: 'PracticeArea::LevelUpSession'
  has_many :questions, through: :level_up_sessions, 
  class_name: 'PracticeArea::LevelUpSession'
  has_many :questions, class_name: 'PracticeArea::Question'
  def username
    self.email.split('@')[0].capitalize
  end
  has_many :participants
  has_many :rooms

  def avg_time_taken
    self.questions.average(:time_taken)
  end

  def best_time_taken
    self.questions.minimum(:time_taken)
  end
end
