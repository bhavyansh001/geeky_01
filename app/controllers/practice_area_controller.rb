class PracticeAreaController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def level_up
    @level_up_session = current_user.level_up_sessions.create
  end
  def bro_vs_pro
  end
  def bro_vs_bro
  end
end
