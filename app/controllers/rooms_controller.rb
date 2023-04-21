class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :room_parameters, only: [:show]
  def create
    @room = current_user.rooms.create(name: params[:name])
    redirect_to room_path(@room)
  end
  def show
    @creator = @room.user
  end
  def join
    @room_id = params[:url].split("/").last.to_i
    @room = current_user.rooms.find(@room_id)
    redirect_to room_path(@room)
  end
  private
  def room_parameters
    @room = Room.find(params[:id])
    @room_id = params[:id]
  end
end
