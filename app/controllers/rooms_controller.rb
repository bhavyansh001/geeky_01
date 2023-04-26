class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :room_parameters, only: [:show]
  def create
    @room = current_user.rooms.create(name: params[:name])
    add_participant
    redirect_to room_path(@room)
  end
  def show
    @creator = @room.user
    @all_users = User.joins(:participants)
    .where(participants: { room_id: @room.id })
    .order(created_at: :asc)
    add_participant unless current_user == @creator
  end
  private
  def room_parameters
    @room = Room.find(params[:id])
    @room_id = params[:id]
  end
  def add_participant
    unless Participant.exists?(user: current_user, room: @room)
      Participant.create(user: current_user, room: @room)
    end
  end  
end
