class RoomsController < ApplicationController
  before_action :show, only: [:join_room]
  def create
    @room = current_user.rooms.create(name: params[:name])
    redirect_to room_path(@room)
  end
  def show
    @room = Room.last
    @user = current_user.email.split('@')[0].capitalize
  end
  def join
    @room_id = params[:url].split("/").last.to_i
    redirect_to join_url
  end
  def join_room
    @join_room = Room.where(id: @room_id)
  end
end
