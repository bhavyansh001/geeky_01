class RoomsController < ApplicationController
  def create
    @room = current_user.rooms.create(name: params[:name])
    redirect_to room_path(@room)
  end
  def show
    @room = Room.last
  end
end
