class BroVsBroController < ApplicationController  
  def create
    @room = current_user.rooms.create(name: params[:name])
    redirect_to '/bro_vs_bro/show'
  end
  def show
    @room = Room.last
  end
end
