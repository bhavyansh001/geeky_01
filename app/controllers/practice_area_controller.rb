class PracticeAreaController < ApplicationController
  before_action :random_nums
  before_action :operator
  before_action :authenticate_user!
  before_action :set_exp_ans

  def index
    @question = Question.new(question_params)
    if @question.save
      redirect_to 'articles/index',
      notice: 'Saved'
    else
      notice:'Failed to save'
    end
  end
  def countdown
    @countdown = 10
  end
  def level_up
  end
  def bro_vs_pro
  end
  def bro_vs_bro
  end

  def create
   
  end
  private
  def question_params
    params.require(:question).permit(:solution)
  end
  def random_nums
    @num1 = Random.rand(20).to_s
    @num2 = Random.rand(10).to_s
  end
  def operator
    op_array = ['+', '-', '*', '/']
    @operator = op_array.sample
  end
  def set_exp_ans
    @expression = (@num1 + @operator + @num2)
    @ans = eval("#{@expression}")
  end
end
