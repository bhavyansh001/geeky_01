class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit :update_users

  private
  def update_users
    broadcast_append_later_to("users", partial: "users/user")
  end
end
