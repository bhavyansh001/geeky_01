class BroSessionController < ApplicationController
    before_action :authenticate_user!
    before_action :operator, only: [:index]
    before_action :random_nums, only: [:index]
    before_action :set_params, only: [:create]
    before_action :set_room
  def index
    @expression = (@num1 + @operator + @num2)
    @@is_correct = eval("#{@expression}")
  end
  def create
    if @question.save
        redirect_to room_bro_session_index_path(@room)
        set_bro_session
    end
  end
  def set_room
    @room = Room.find(params[:room_id])
  end
  private
  def operator
    op_array = ['+', '-', '*', '/']
    @operator = op_array.sample
  end
  def random_nums
    @num1 = Random.rand(20).to_s
    @num2 = (Random.rand(10) + 1).to_s
  end
  def set_params
    @question = PracticeArea::Question.new(
      expression: params[:expression],
      solution: params[:solution],
      is_correct: params[:solution].to_i == @@is_correct,
      user_id: current_user.id,
      time_taken: (Time.now.sec - params[:time_taken].to_i) % 60
    )
  end
  def set_bro_session
    participant = Participant.find_by(user: current_user, room_id: params[:room_id])
    @bro_session = BroSession.create(question: @question, participant: participant)
  end
  
end
