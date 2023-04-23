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

  def username
    self.email.split('@')[0].capitalize
  end
  has_many :participants
  has_many :rooms, through: :participants
end
