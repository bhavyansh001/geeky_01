class BroVsBroController < ApplicationController
  def    
  end  
  def create
    @room = current_user.rooms.create(room_params)
    redirect_to @room
  end
  private
  def room_params
    params.require(:room).permit(:name)
  end
end
