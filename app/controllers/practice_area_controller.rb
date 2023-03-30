class PracticeAreaController < ApplicationController
  before_action :authenticate_user!
  before_action :random_nums
  before_action :operator
  before_action :set_question, only: [:question, :create]
  before_action :set_params, only: [:create]

  def index
  end
  def level_up
  end
  def question
    set_exp_ans
  end
  def bro_vs_pro
  end
  def bro_vs_bro
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
    @question = PracticeArea::Question.new
  end
  def set_params
    @question.expression = params[:expression]
    @question.solution = params[:solution]
    @question.time_taken = Time.now.sec - params[:time_taken].to_i
  end
end
