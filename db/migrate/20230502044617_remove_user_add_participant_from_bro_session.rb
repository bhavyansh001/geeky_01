class RemoveUserAddParticipantFromBroSession < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bro_sessions, :user, index: true, foreign_key: true
    add_reference :bro_sessions, :participant, index: true, foreign_key: true
  end
end
