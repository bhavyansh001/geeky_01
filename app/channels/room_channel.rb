class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def redirect_to_dashboard(data)
    ActionCable.server.broadcast("room_#{params[:room_id]}", { type: 'redirect', url: data['url'] })
  end
end
