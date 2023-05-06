class AddRoomIdToBroSession < ActiveRecord::Migration[7.0]
  def change
    add_reference :bro_sessions, :room, null: false, foreign_key: true
  end
end
