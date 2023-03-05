class PracticeAreaController < ApplicationController
  before_action :random_nums
  before_action :operator
  before_action :set_exp_ans
  before_action :authenticate_user!
  before_action :question_for_views

  def index
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

    if @question.save
      redirect_to practice_area_index_path, notice: 'Question was successfully saved.'
    else
      render :level_up, notice: 'Question could not be saved.'
    end
  end
  private
  def question_params
    params.require(:question).permit(:question, :solution)
  end
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
  def question_for_views
    @question = Question.new
  end
end
