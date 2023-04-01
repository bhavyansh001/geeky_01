class LevelUpSessionController < ApplicationController
  before_action :authenticate_user!
  before_action :random_nums
  before_action :operator
  before_action :set_question, only: [:question, :create, :set_params]
  before_action :set_params, only: [:create]

  def question
    set_exp_ans
  end
  def create
    if @question.save
      redirect_to :question
    else
      render :question, notice: 'Question could not be saved.'
    end
  end
  def time_up
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
  def set_exp_ans
    @expression = (@num1 + @operator + @num2)
    @ans = eval("#{@expression}")
  end
  def set_question
    @level_up_session = PracticeArea::LevelUpSession.last
    @question = @level_up_session.questions.new
  end
  def set_params
    @question.expression = params[:expression]
    @question.solution = params[:solution]

    @time = Time.now.sec - params[:time_taken].to_i
    if @time > 40
        @question.time_taken = 60 - @time
    else
        @question.time_taken = @time
    end
  end
end
