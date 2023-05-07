class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :bro_sessions
  after_create_commit :update_users

  private
  def update_users
    participant = Participant.find(self.id)
    user = User.find(participant.user_id)
    broadcast_append_later_to(room, :user, target: "room", partial: "users/user", locals: {user: user})
  end
end 