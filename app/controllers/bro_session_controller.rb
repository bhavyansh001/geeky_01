class BroSessionController < ApplicationController
    before_action :authenticate_user!
    before_action :operator, only: [:index]
    before_action :random_nums, only: [:index]
    before_action :set_params, only: [:create]
  def index
    @expression = (@num1 + @operator + @num2)
    @@is_correct = eval("#{@expression}")
  end
  def create
    if @question.save
        redirect_to room_bro_session_index_path
    end
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
end
